#!/usr/bin/env ruby
# frozen_string_literal: true

# Changelog management for Keep a Changelog format.
#
# Usage:
#   ruby scripts/update-changelog.rb stamp VERSION [--date DATE]
#   ruby scripts/update-changelog.rb consolidate VERSION [--date DATE]
#   ruby scripts/update-changelog.rb extract VERSION
#
# Operations:
#   stamp       - Move Unreleased entries to a new version section (pre-releases)
#   consolidate - Merge pre-release sections into a stable release, collapse in <details>
#   extract     - Print a version's changelog body to stdout (for GitHub Release notes)

CHANGELOG_PATH = File.expand_path("../CHANGELOG.md", __dir__)
CATEGORIES = %w[Added Changed Deprecated Removed Fixed Security].freeze
SECTION_HEADING = /^## \[/
VERSION_HEADING = /^## \[(.+?)\](?: - (.+))?$/
PRE_RELEASE_PATTERN = /(pre|alpha|beta|rc)/

def read_changelog
  abort "Error: #{CHANGELOG_PATH} not found" unless File.exist?(CHANGELOG_PATH)
  File.read(CHANGELOG_PATH)
end

def write_changelog(content)
  File.write(CHANGELOG_PATH, content)
end

# Split changelog into preamble (everything before first ## [) and sections.
# Each section is { heading: "## [X.Y.Z] - date", body: "..." }
def parse_sections(content)
  lines = content.lines
  preamble_lines = []
  sections = []
  current_section = nil

  lines.each do |line|
    if line.match?(SECTION_HEADING)
      sections << current_section if current_section
      current_section = { heading: line.chomp, body: "" }
    elsif current_section
      current_section[:body] += line
    else
      preamble_lines << line
    end
  end
  sections << current_section if current_section

  [preamble_lines.join, sections]
end

def section_version(section)
  match = section[:heading].match(VERSION_HEADING)
  match ? match[1] : nil
end

def prerelease?(version)
  version.match?(PRE_RELEASE_PATTERN)
end

# Parse category entries from a section body.
# Returns { "Added" => ["- item1", "- item2"], "Fixed" => [...], ... }
def parse_categories(body)
  categories = {}
  current_cat = nil

  body.each_line do |line|
    if line.match?(/^### (.+)/)
      current_cat = line.match(/^### (.+)/)[1].strip
      categories[current_cat] ||= []
    elsif current_cat && line.match?(/^\s*-\s+/)
      categories[current_cat] << line.rstrip
    end
  end

  categories
end

# Merge multiple category hashes into one, deduplicating exact matches.
def merge_categories(category_list)
  merged = {}
  category_list.each do |cats|
    cats.each do |cat, items|
      merged[cat] ||= []
      items.each { |item| merged[cat] << item unless merged[cat].include?(item) }
    end
  end
  merged
end

# Format merged categories into markdown body text.
def format_categories(categories)
  output = ""
  CATEGORIES.each do |cat|
    next unless categories[cat] && !categories[cat].empty?
    output += "\n### #{cat}\n\n"
    categories[cat].each { |item| output += "#{item}\n" }
  end
  # Include any non-standard categories
  categories.each do |cat, items|
    next if CATEGORIES.include?(cat) || items.empty?
    output += "\n### #{cat}\n\n"
    items.each { |item| output += "#{item}\n" }
  end
  output
end

def today
  Time.now.strftime("%Y-%m-%d")
end

def parse_date_arg(args)
  idx = args.index("--date")
  idx ? args[idx + 1] : today
end

# --- Operations ---

def stamp(version, date)
  content = read_changelog
  preamble, sections = parse_sections(content)

  unreleased_idx = sections.index { |s| section_version(s) == "Unreleased" }
  unless unreleased_idx
    abort "Error: No '## [Unreleased]' section found in CHANGELOG.md"
  end

  unreleased = sections[unreleased_idx]
  body = unreleased[:body].strip

  if body.empty?
    warn "Warning: Unreleased section is empty. Creating version entry with no content."
  end

  new_unreleased = { heading: "## [Unreleased]", body: "\n\n" }
  new_version = { heading: "## [#{version}] - #{date}", body: body.empty? ? "\n\n" : "\n#{body}\n\n" }

  sections[unreleased_idx] = new_unreleased
  sections.insert(unreleased_idx + 1, new_version)

  write_result(preamble, sections)
end

def consolidate(version, date)
  content = read_changelog
  preamble, sections = parse_sections(content)

  unreleased_idx = sections.index { |s| section_version(s) == "Unreleased" }
  unless unreleased_idx
    abort "Error: No '## [Unreleased]' section found in CHANGELOG.md"
  end

  # Collect Unreleased + pre-release sections until the first stable release
  pre_sections = []
  category_list = []
  stop_idx = nil

  # Start after Unreleased
  unreleased = sections[unreleased_idx]
  unreleased_cats = parse_categories(unreleased[:body])
  category_list << unreleased_cats unless unreleased_cats.empty?

  ((unreleased_idx + 1)...sections.length).each do |i|
    v = section_version(sections[i])
    if v && prerelease?(v)
      pre_sections << sections[i]
      category_list << parse_categories(sections[i][:body])
    else
      stop_idx = i
      break
    end
  end

  # If no pre-release sections found, this is just a stamp
  if pre_sections.empty?
    stamp(version, date)
    return
  end

  merged = merge_categories(category_list)
  consolidated_body = format_categories(merged)

  # Build <details> block with pre-release history.
  # Use bold text instead of ## headings to avoid breaking the section parser.
  details = "\n<details>\n<summary>Pre-release history</summary>\n\n"
  pre_sections.each do |s|
    v = section_version(s)
    match = s[:heading].match(VERSION_HEADING)
    date_str = match[2] ? " - #{match[2]}" : ""
    details += "**#{v}#{date_str}**\n#{s[:body].rstrip}\n\n"
  end
  details += "</details>\n\n"

  # Reconstruct sections
  new_sections = []
  new_sections << { heading: "## [Unreleased]", body: "\n\n" }
  new_sections << { heading: "## [#{version}] - #{date}", body: "#{consolidated_body}\n#{details}" }

  # Add remaining stable sections
  remaining_start = stop_idx || sections.length
  new_sections.concat(sections[remaining_start..])

  write_result(preamble, new_sections)
end

def extract(version)
  content = read_changelog
  _, sections = parse_sections(content)

  section = sections.find { |s| section_version(s) == version }
  if section
    # Output body, stripping the <details> block for cleaner release notes
    body = section[:body]
    # Remove <details>...</details> block if present
    body = body.sub(%r{<details>.*?</details>}m, "").strip
    puts body unless body.empty?
  end
end

def write_result(preamble, sections)
  output = preamble.rstrip + "\n\n"
  sections.each do |s|
    output += "#{s[:heading]}\n#{s[:body].rstrip}\n\n"
  end
  write_changelog(output.rstrip + "\n")
end

# --- Main ---

operation = ARGV[0]
version = ARGV[1]

case operation
when "stamp"
  abort "Usage: ruby #{$PROGRAM_NAME} stamp VERSION [--date DATE]" unless version
  stamp(version, parse_date_arg(ARGV))
when "consolidate"
  abort "Usage: ruby #{$PROGRAM_NAME} consolidate VERSION [--date DATE]" unless version
  consolidate(version, parse_date_arg(ARGV))
when "extract"
  abort "Usage: ruby #{$PROGRAM_NAME} extract VERSION" unless version
  extract(version)
else
  abort "Usage: ruby #{$PROGRAM_NAME} {stamp|consolidate|extract} VERSION [--date DATE]"
end

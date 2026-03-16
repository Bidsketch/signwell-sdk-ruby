#!/usr/bin/env bash
set -euo pipefail

# Semantic version bumping for SDK releases.
#
# Usage: scripts/bump-version.sh BUMP_TYPE --file PATH --pattern REGEX --replace TEMPLATE
#
# Arguments:
#   BUMP_TYPE   One of: pre, patch, minor, major, preminor, premajor
#   --file      Path to the file containing the version string
#   --pattern   grep -oP pattern to extract the version (must capture X.Y.Z or X.Y.Z.pre.label.N)
#   --replace   sed pattern to replace the version. Use %s as placeholder for the new version.
#
# Examples:
#   # Ruby: VERSION = '0.1.0.pre.alpha.8'
#   scripts/bump-version.sh pre --file lib/signwell_sdk/version.rb \
#     --pattern "VERSION\s*=\s*'([^']+)'" --replace "s/VERSION = '.*'/VERSION = '%s'/"
#
#   # Python: __version__ = "0.1.0a8"
#   scripts/bump-version.sh patch --file src/signwell/__init__.py \
#     --pattern '__version__\s*=\s*"([^"]+)"' --replace 's/__version__ = ".*"/__version__ = "%s"/'
#
#   # Node: "version": "0.1.0-alpha.8"
#   scripts/bump-version.sh minor --file package.json \
#     --pattern '"version":\s*"([^"]+)"' --replace 's/"version": ".*"/"version": "%s"/'
#
# Output: Prints the new version to stdout. Updates the file in-place.

# --- Argument parsing ---

BUMP_TYPE=""
VERSION_FILE=""
VERSION_PATTERN=""
REPLACE_TEMPLATE=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --file) VERSION_FILE="$2"; shift 2 ;;
    --pattern) VERSION_PATTERN="$2"; shift 2 ;;
    --replace) REPLACE_TEMPLATE="$2"; shift 2 ;;
    pre|patch|minor|major|preminor|premajor)
      BUMP_TYPE="$1"; shift ;;
    *)
      echo "Error: Unknown argument '$1'" >&2
      exit 1 ;;
  esac
done

if [[ -z "$BUMP_TYPE" || -z "$VERSION_FILE" || -z "$VERSION_PATTERN" || -z "$REPLACE_TEMPLATE" ]]; then
  echo "Usage: $0 BUMP_TYPE --file PATH --pattern REGEX --replace TEMPLATE" >&2
  echo "Valid bump types: pre, patch, minor, major, preminor, premajor" >&2
  exit 1
fi

if [[ ! -f "$VERSION_FILE" ]]; then
  echo "Error: File not found: $VERSION_FILE" >&2
  exit 1
fi

# --- Extract current version ---
# Use perl for portable PCRE support (macOS grep lacks -P)

CURRENT=$(perl -ne "print \$1 if /$VERSION_PATTERN/" "$VERSION_FILE" | head -1)

if [[ -z "$CURRENT" ]]; then
  echo "Error: Could not extract version from $VERSION_FILE using pattern: $VERSION_PATTERN" >&2
  exit 1
fi

# --- Parse version ---

parse_version() {
  local version="$1"

  if [[ "$version" =~ ^([0-9]+)\.([0-9]+)\.([0-9]+)\.pre\.([a-zA-Z]+)\.([0-9]+)$ ]]; then
    MAJOR="${BASH_REMATCH[1]}"
    MINOR="${BASH_REMATCH[2]}"
    PATCH="${BASH_REMATCH[3]}"
    PRE_LABEL="${BASH_REMATCH[4]}"
    PRE_NUM="${BASH_REMATCH[5]}"
    IS_PRE=true
  elif [[ "$version" =~ ^([0-9]+)\.([0-9]+)\.([0-9]+)$ ]]; then
    MAJOR="${BASH_REMATCH[1]}"
    MINOR="${BASH_REMATCH[2]}"
    PATCH="${BASH_REMATCH[3]}"
    PRE_LABEL=""
    PRE_NUM=""
    IS_PRE=false
  else
    echo "Error: Cannot parse version '$version'. Expected X.Y.Z or X.Y.Z.pre.label.N" >&2
    exit 1
  fi
}

format_version() {
  if [[ "$IS_PRE" == true ]]; then
    echo "${MAJOR}.${MINOR}.${PATCH}.pre.${PRE_LABEL}.${PRE_NUM}"
  else
    echo "${MAJOR}.${MINOR}.${PATCH}"
  fi
}

# --- Bump logic ---

parse_version "$CURRENT"

case "$BUMP_TYPE" in
  pre)
    if [[ "$IS_PRE" == true ]]; then
      PRE_NUM=$((PRE_NUM + 1))
    else
      PATCH=$((PATCH + 1))
      PRE_LABEL="alpha"
      PRE_NUM=1
      IS_PRE=true
    fi
    ;;
  patch)
    if [[ "$IS_PRE" == true ]]; then
      IS_PRE=false
      PRE_LABEL=""
      PRE_NUM=""
    else
      PATCH=$((PATCH + 1))
    fi
    ;;
  minor)
    if [[ "$IS_PRE" == true ]]; then
      if [[ "$PATCH" -eq 0 ]]; then
        IS_PRE=false
        PRE_LABEL=""
        PRE_NUM=""
      else
        MINOR=$((MINOR + 1))
        PATCH=0
        IS_PRE=false
        PRE_LABEL=""
        PRE_NUM=""
      fi
    else
      MINOR=$((MINOR + 1))
      PATCH=0
    fi
    ;;
  major)
    if [[ "$IS_PRE" == true ]]; then
      if [[ "$MINOR" -eq 0 && "$PATCH" -eq 0 ]]; then
        IS_PRE=false
        PRE_LABEL=""
        PRE_NUM=""
      else
        MAJOR=$((MAJOR + 1))
        MINOR=0
        PATCH=0
        IS_PRE=false
        PRE_LABEL=""
        PRE_NUM=""
      fi
    else
      MAJOR=$((MAJOR + 1))
      MINOR=0
      PATCH=0
    fi
    ;;
  preminor)
    if [[ "$IS_PRE" == true ]]; then
      echo "Error: 'preminor' can only be used from a stable version (current: $CURRENT)" >&2
      exit 1
    fi
    MINOR=$((MINOR + 1))
    PATCH=0
    PRE_LABEL="alpha"
    PRE_NUM=1
    IS_PRE=true
    ;;
  premajor)
    if [[ "$IS_PRE" == true ]]; then
      echo "Error: 'premajor' can only be used from a stable version (current: $CURRENT)" >&2
      exit 1
    fi
    MAJOR=$((MAJOR + 1))
    MINOR=0
    PATCH=0
    PRE_LABEL="alpha"
    PRE_NUM=1
    IS_PRE=true
    ;;
esac

NEW_VERSION=$(format_version)

# --- Update file ---

SED_PATTERN=$(printf "$REPLACE_TEMPLATE" "$NEW_VERSION")
if [[ "$(uname)" == "Darwin" ]]; then
  sed -i '' -E "$SED_PATTERN" "$VERSION_FILE"
else
  sed -i -E "$SED_PATTERN" "$VERSION_FILE"
fi

echo "$NEW_VERSION"

# frozen_string_literal: true
# Source: signwell-sdk-generator/extras/ruby/overlay/lib/signwell_sdk/extras/embedded/view_helpers.rb
# Do not edit the generated SDK copy directly.

require 'json'
require 'uri'

module SignWell
  module Embedded
    # Rails ActionView helpers for rendering embedded signing and requesting iframes.
    #
    # These helpers are automatically available in your views when using Rails
    # (via the {SignWell::Embedded::Railtie}). For non-Rails apps, you can include
    # this module directly in your view context.
    #
    # @example In a Rails view (ERB)
    #   <head>
    #     <%= signwell_embed_script_tag %>
    #   </head>
    #   <body>
    #     <%= signwell_signing_iframe(url: @signing_url) %>
    #   </body>
    #
    # @see https://developers.signwell.com/reference/embedded-signing SignWell Embedded Docs
    module ViewHelpers
      SAFE_HANDLER_PATH = /\A[$A-Z_][0-9A-Z_$]*(?:\.[$A-Z_][0-9A-Z_$]*)*\z/i
      BLOCKED_HANDLER_SEGMENTS = %w[__proto__ constructor prototype].freeze

      # Renders a +<script>+ tag that loads the SignWell embedded JavaScript library.
      #
      # Uses +javascript_include_tag+ when available (Rails), otherwise falls back
      # to a plain HTML script tag.
      #
      # @return [String] HTML script tag (marked +html_safe+ when available).
      def signwell_embed_script_tag
        if respond_to?(:javascript_include_tag)
          javascript_include_tag(SignWell::Embedded::SCRIPT_URL)
        else
          tag = SignWell::Embedded.script_tag
          tag.respond_to?(:html_safe) ? tag.html_safe : tag
        end
      end

      # Renders JavaScript that opens an embedded signing iframe.
      #
      # All options map directly to the +SignWellEmbed+ JavaScript constructor.
      #
      # @param url [String] The signing URL for the recipient (required).
      # @param container_id [String, nil] DOM element ID to embed into. When nil,
      #   opens as a modal overlay.
      # @param allow_decline [Boolean] Show the decline option (default: true).
      # @param allow_close [Boolean] Allow closing before signing (default: true).
      # @param show_header [Boolean] Show the SignWell header (default: true).
      # @param allow_download [Boolean] Allow downloading the document (default: true).
      # @param redirect_url [String, nil] URL to redirect after signing.
      # @param decline_redirect_url [String, nil] URL to redirect if declined.
      # @param allowed_embed_hosts [Array<String>, nil] Extra exact SignWell embed hosts.
      # @param allowed_redirect_hosts [Array<String>, nil] Exact redirect hosts to allow.
      # @param events [Hash{String,Symbol => String}] JavaScript event callbacks.
      #   Keys are event names (+completed+, +closed+, +declined+, +error+),
      #   values are JavaScript function paths as strings (for example
      #   +"SignWellHandlers.onComplete"+). Raw JavaScript is not accepted.
      # @param auto_open [Boolean] Call +.open()+ automatically (default: true).
      # @return [String] HTML script tag with the embed code.
      #
      # @example Basic signing embed
      #   signwell_signing_iframe(url: @signing_url)
      #
      # @example With events and container
      #   signwell_signing_iframe(
      #     url: @signing_url,
      #     container_id: 'sign-here',
      #     events: { completed: 'onComplete', closed: 'onClose' }
      #   )
      def signwell_signing_iframe(url:, container_id: nil,
                                  allow_decline: true, allow_close: true,
                                  show_header: true, allow_download: true,
                                  redirect_url: nil, decline_redirect_url: nil,
                                  allowed_embed_hosts: nil, allowed_redirect_hosts: nil,
                                  events: {}, auto_open: true)
        js_options = iframe_options(
          url: url,
          allowed_embed_hosts: allowed_embed_hosts,
          allowed_redirect_hosts: allowed_redirect_hosts,
          values: { containerId: container_id },
          booleans: {
            allowDecline: allow_decline,
            allowClose: allow_close,
            showHeader: show_header,
            allowDownload: allow_download
          },
          redirects: {
            redirectUrl: redirect_url,
            declineRedirectUrl: decline_redirect_url
          }
        )

        build_embed_script(js_options, events, auto_open)
      end

      # Renders JavaScript that opens an embedded requesting (field placement) iframe.
      #
      # @param url [String] The +embedded_edit_url+ from the document response (required).
      # @param container_id [String, nil] DOM element ID to embed into.
      # @param allow_close [Boolean] Allow closing the editor (default: true).
      # @param show_header [Boolean] Show the SignWell header (default: true).
      # @param allow_download [Boolean] Allow downloading (default: true).
      # @param show_send_button [Boolean] Show the send button (default: true).
      # @param redirect_url [String, nil] URL to redirect after sending.
      # @param allowed_embed_hosts [Array<String>, nil] Extra exact SignWell embed hosts.
      # @param allowed_redirect_hosts [Array<String>, nil] Exact redirect hosts to allow.
      # @param events [Hash{String,Symbol => String}] JavaScript event callbacks.
      # @param auto_open [Boolean] Call +.open()+ automatically (default: true).
      # @return [String] HTML script tag with the embed code.
      #
      # @example Basic requesting embed
      #   signwell_requesting_iframe(url: @edit_url)
      def signwell_requesting_iframe(url:, container_id: nil,
                                     allow_close: true, show_header: true,
                                     allow_download: true, show_send_button: true,
                                     redirect_url: nil, allowed_embed_hosts: nil,
                                     allowed_redirect_hosts: nil, events: {},
                                     auto_open: true)
        js_options = iframe_options(
          url: url,
          allowed_embed_hosts: allowed_embed_hosts,
          allowed_redirect_hosts: allowed_redirect_hosts,
          values: { containerId: container_id },
          booleans: {
            allowClose: allow_close,
            showHeader: show_header,
            allowDownload: allow_download,
            showSendButton: show_send_button
          },
          redirects: { redirectUrl: redirect_url }
        )

        build_embed_script(js_options, events, auto_open)
      end

      private

      def iframe_options(url:, allowed_embed_hosts:, allowed_redirect_hosts:, values:, booleans:, redirects:)
        options = { url: validate_embed_url(url, allowed_embed_hosts) }
        values.each { |key, value| options[key] = value if value }
        booleans.each { |key, value| options[key] = value if value == false }
        redirects.each do |key, value|
          redirect = validate_redirect_url(value, allowed_redirect_hosts)
          options[key] = redirect if redirect
        end
        options
      end

      def build_embed_script(js_options, events, auto_open)
        config = script_safe_json(js_options)
        event_paths = script_safe_json(normalize_event_paths(events))

        js = <<~JAVASCRIPT
          (function() {
            var config = #{config};
            var eventPaths = #{event_paths};
            var resolveSignWellHandler = function(path) {
              if (!path) return null;
              return path.split('.').reduce(function(context, key) {
                return context && context[key];
              }, globalThis);
            };

            if (Object.keys(eventPaths).length > 0) {
              config.events = {};
              Object.keys(eventPaths).forEach(function(name) {
                var handler = resolveSignWellHandler(eventPaths[name]);
                if (typeof handler === 'function') {
                  config.events[name] = handler;
                }
              });
            }

            var embed = new SignWellEmbed(config);
            #{'embed.open();' if auto_open}
          })();
        JAVASCRIPT
        if respond_to?(:javascript_tag)
          begin
            return javascript_tag(nonce: true) { js }
          rescue NameError => e
            raise unless e.name == :content_security_policy_nonce
          end
          html = %(<script>#{js}</script>)
          html.respond_to?(:html_safe) ? html.html_safe : html
        else
          html = %(<script>#{js}</script>)
          html.respond_to?(:html_safe) ? html.html_safe : html
        end
      end

      def normalize_event_paths(events)
        events.each_with_object({}) do |(event_name, handler_path), normalized|
          path = handler_path.to_s.strip
          unless SAFE_HANDLER_PATH.match?(path)
            raise ArgumentError,
                  "Event handler paths must be dot-separated JavaScript identifiers. Invalid handler for #{event_name}: #{handler_path.inspect}"
          end

          if path.split('.').any? { |segment| BLOCKED_HANDLER_SEGMENTS.include?(segment) }
            raise ArgumentError,
                  "Event handler paths cannot include prototype-chain segments. Invalid handler for #{event_name}: #{handler_path.inspect}"
          end

          normalized[event_name.to_s] = path
        end
      end

      def validate_embed_url(raw_url, allowed_hosts)
        parsed = parse_https_url(raw_url, 'Embed URL')
        hostname = parsed.host.downcase
        allowed_host_set = normalize_allowed_hosts(allowed_hosts)
        unless default_signwell_host?(hostname) || allowed_host_set.include?(hostname)
          raise ArgumentError, 'Embed URL host is not allowed'
        end

        parsed.to_s
      end

      def validate_redirect_url(raw_url, allowed_hosts)
        return nil if raw_url.nil?

        parsed = parse_https_url(raw_url, 'Redirect URL')
        allowed_host_set = normalize_allowed_hosts(allowed_hosts)
        if allowed_host_set.any? && !allowed_host_set.include?(parsed.host.downcase)
          raise ArgumentError, 'Redirect URL host is not allowed'
        end

        parsed.to_s
      end

      def parse_https_url(raw_url, label)
        parsed = URI.parse(raw_url.to_s)
        raise ArgumentError, "#{label} must use HTTPS" unless parsed.is_a?(URI::HTTPS)
        raise ArgumentError, "#{label} must not include credentials" if parsed.user || parsed.password
        raise ArgumentError, "#{label} host is required" if parsed.host.nil? || parsed.host.empty?

        parsed
      rescue URI::InvalidURIError
        raise ArgumentError, "#{label} is invalid"
      end

      def default_signwell_host?(hostname)
        hostname == 'signwell.com' || hostname.end_with?('.signwell.com')
      end

      def normalize_allowed_hosts(allowed_hosts)
        Array(allowed_hosts).each_with_object([]) do |host, normalized|
          value = host.to_s.strip.downcase
          raise ArgumentError, 'Allowed hosts must be exact hostnames' if value.empty? || value.match?(%r{[/@:]})

          normalized << value
        end
      end

      def script_safe_json(value)
        JSON.generate(value).gsub(/[<>&\u2028\u2029]/) do |char|
          case char
          when '<' then '\\u003c'
          when '>' then '\\u003e'
          when '&' then '\\u0026'
          when "\u2028" then '\\u2028'
          when "\u2029" then '\\u2029'
          else char
          end
        end
      end
    end
  end
end

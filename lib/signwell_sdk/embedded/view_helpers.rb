# frozen_string_literal: true

require 'json'

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
      # @param events [Hash{String,Symbol => String}] JavaScript event callbacks.
      #   Keys are event names (+completed+, +closed+, +declined+, +error+),
      #   values are JavaScript function names as strings.
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
      def signwell_signing_iframe(url:, container_id: nil, # rubocop:disable Metrics/CyclomaticComplexity,Metrics/ParameterLists
                                  allow_decline: true, allow_close: true,
                                  show_header: true, allow_download: true,
                                  redirect_url: nil, decline_redirect_url: nil,
                                  events: {}, auto_open: true)
        js_options = { url: url }
        js_options[:containerId] = container_id if container_id
        js_options[:allowDecline] = allow_decline unless allow_decline
        js_options[:allowClose] = allow_close unless allow_close
        js_options[:showHeader] = show_header unless show_header
        js_options[:allowDownload] = allow_download unless allow_download
        js_options[:redirectUrl] = redirect_url if redirect_url
        js_options[:declineRedirectUrl] = decline_redirect_url if decline_redirect_url

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
      # @param events [Hash{String,Symbol => String}] JavaScript event callbacks.
      # @param auto_open [Boolean] Call +.open()+ automatically (default: true).
      # @return [String] HTML script tag with the embed code.
      #
      # @example Basic requesting embed
      #   signwell_requesting_iframe(url: @edit_url)
      def signwell_requesting_iframe(url:, container_id: nil, # rubocop:disable Metrics/ParameterLists
                                     allow_close: true, show_header: true,
                                     allow_download: true, show_send_button: true,
                                     redirect_url: nil, events: {},
                                     auto_open: true)
        js_options = { url: url }
        js_options[:containerId] = container_id if container_id
        js_options[:allowClose] = allow_close unless allow_close
        js_options[:showHeader] = show_header unless show_header
        js_options[:allowDownload] = allow_download unless allow_download
        js_options[:showSendButton] = show_send_button unless show_send_button
        js_options[:redirectUrl] = redirect_url if redirect_url

        build_embed_script(js_options, events, auto_open)
      end

      private

      def build_embed_script(js_options, events, auto_open)
        config = JSON.generate(js_options)

        # Inject event handlers as raw JS function references (not JSON strings)
        unless events.empty?
          event_pairs = events.map { |k, v| "#{k}: #{v}" }.join(', ')
          config = config.sub(/\}\z/, ", events: { #{event_pairs} }}")
        end

        js = "var embed = new SignWellEmbed(#{config});"
        js += ' embed.open();' if auto_open
        html = %(<script>#{js}</script>)
        html.respond_to?(:html_safe) ? html.html_safe : html
      end
    end
  end
end

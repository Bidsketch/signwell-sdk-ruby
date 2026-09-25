# frozen_string_literal: true

require 'erb'
require 'spec_helper'

RSpec.describe SignWell::Embedded::ViewHelpers do
  let(:helper) do
    Class.new do
      include SignWell::Embedded::ViewHelpers
    end.new
  end

  # Mirrors ActionView's javascript_tag contract: a block result goes through +capture+, which
  # html_escapes any String that is not html_safe, while a content argument is emitted verbatim.
  # A fake that simply yields would stay green while real Rails output is broken JavaScript.
  let(:rails_like_helper) do
    Class.new do
      include SignWell::Embedded::ViewHelpers

      attr_reader :javascript_tag_options

      def javascript_tag(content_or_options = nil, html_options = {}, &block)
        if block
          html_options = content_or_options if content_or_options.is_a?(Hash)
          content = block.call
          content = ERB::Util.html_escape(content) unless content.respond_to?(:html_safe?) && content.html_safe?
        else
          content = content_or_options
        end
        @javascript_tag_options = html_options
        nonce = html_options[:nonce] == true ? content_security_policy_nonce : html_options[:nonce]
        %(<script nonce="#{nonce}">\n//<![CDATA[\n#{content}\n//]]>\n</script>)
      end

      def content_security_policy_nonce
        'test-nonce'
      end
    end.new
  end

  describe '#signwell_signing_iframe' do
    it 'escapes script-breaking payloads in the generated JavaScript' do
      html = helper.signwell_signing_iframe(
        url: 'https://www.signwell.com/sign',
        container_id: '</script><script>alert(1)</script>'
      )

      expect(html.scan('<script>').count).to eq(1)
      expect(html.scan('</script>').count).to eq(1)
      expect(html).not_to include('</script><script>alert(1)</script>')
      expect(html).to include('\\u003c/script\\u003e\\u003cscript\\u003ealert(1)\\u003c/script\\u003e')
    end

    it 'rejects unsafe raw callback code' do
      expect do
        helper.signwell_signing_iframe(
          url: 'https://www.signwell.com/sign',
          events: { completed: 'alert(1)' }
        )
      end.to raise_error(ArgumentError, /Event handler paths/)
    end

    it 'accepts safe function paths and serializes them as data' do
      html = helper.signwell_signing_iframe(
        url: 'https://www.signwell.com/sign',
        events: { completed: 'SignWellHandlers.onComplete' }
      )

      expect(html).to include('"completed":"SignWellHandlers.onComplete"')
      expect(html).to include('resolveSignWellHandler')
    end

    it 'warns in the browser console when a handler path does not resolve to a function' do
      html = helper.signwell_signing_iframe(
        url: 'https://www.signwell.com/sign',
        events: { completed: 'onDone' }
      )

      expect(html).to include("if (typeof handler === 'function')")
      expect(html).to include('console.warn(')
      expect(html).to include('no function found at')
    end

    it 'renders through javascript_tag with a nonce and without html-escaping the script' do
      html = rails_like_helper.signwell_signing_iframe(
        url: 'https://www.signwell.com/sign',
        events: { completed: 'SignWellHandlers.onComplete' }
      )

      expect(rails_like_helper.javascript_tag_options).to eq(nonce: true)
      expect(html).to include('nonce="test-nonce"')
      expect(html).to include('return context && context[key];')
      expect(html).to include('Object.keys(eventPaths).length > 0')
      expect(html).not_to include('&amp;')
      expect(html).not_to include('&gt;')
    end

    it 'falls back to a plain script tag when the view has no CSP nonce helper' do
      helper_without_nonce = Class.new do
        include SignWell::Embedded::ViewHelpers

        attr_reader :javascript_tag_calls

        def javascript_tag(_content = nil, options = {})
          @javascript_tag_calls ||= []
          @javascript_tag_calls << options
          raise NameError.new('missing nonce', :content_security_policy_nonce) if options[:nonce]
        end
      end.new

      html = helper_without_nonce.signwell_signing_iframe(url: 'https://www.signwell.com/sign')

      expect(helper_without_nonce.javascript_tag_calls).to eq([{ nonce: true }])
      expect(html).to include('<script>')
      expect(html).not_to include('nonce=')
      # This and the no-javascript_tag case share one fallback, so it carries the same
      # no-escaping invariant the nonce path above asserts.
      expect(html).to include('return context && context[key];')
      expect(html).not_to include('&amp;&amp;')
    end

    it 'lets an unrelated NameError from the host view propagate instead of swallowing it' do
      helper_with_bug = Class.new do
        include SignWell::Embedded::ViewHelpers

        def javascript_tag(_content = nil, _options = {})
          # A genuine typo in the host application's own helper, not missing CSP support.
          some_undefined_local_helper
        end
      end.new

      expect do
        helper_with_bug.signwell_signing_iframe(url: 'https://www.signwell.com/sign')
      end.to raise_error(NameError, /some_undefined_local_helper/)
    end

    it 'rejects unsafe embed URLs by default' do
      expect do
        helper.signwell_signing_iframe(url: 'javascript:alert(1)')
      end.to raise_error(ArgumentError, /Embed URL must use HTTPS/)

      expect do
        helper.signwell_signing_iframe(url: 'http://www.signwell.com/sign')
      end.to raise_error(ArgumentError, /Embed URL must use HTTPS/)

      expect do
        helper.signwell_signing_iframe(url: 'https://user:pass@www.signwell.com/sign')
      end.to raise_error(ArgumentError, /credentials/)

      expect do
        helper.signwell_signing_iframe(url: 'https://evil.example/sign')
      end.to raise_error(ArgumentError, /host is not allowed/)
    end

    it 'allows exact custom embed hosts for non-production environments' do
      html = helper.signwell_requesting_iframe(
        url: 'https://sandbox.signwell.test/edit',
        allowed_embed_hosts: ['sandbox.signwell.test']
      )

      expect(html).to include('"url":"https://sandbox.signwell.test/edit"')
      expect do
        helper.signwell_requesting_iframe(
          url: 'https://evil-sandbox.signwell.test/edit',
          allowed_embed_hosts: ['sandbox.signwell.test']
        )
      end.to raise_error(ArgumentError, /host is not allowed/)
    end

    it 'validates optional redirect URLs' do
      html = helper.signwell_signing_iframe(
        url: 'https://www.signwell.com/sign',
        redirect_url: 'https://app.example.com/done',
        decline_redirect_url: 'https://app.example.com/declined'
      )

      expect(html).to include('"redirectUrl":"https://app.example.com/done"')
      expect do
        helper.signwell_signing_iframe(
          url: 'https://www.signwell.com/sign',
          redirect_url: 'http://app.example.com/done'
        )
      end.to raise_error(ArgumentError, /Redirect URL must use HTTPS/)
      expect do
        helper.signwell_signing_iframe(
          url: 'https://www.signwell.com/sign',
          redirect_url: 'https://evil.example/done',
          allowed_redirect_hosts: ['app.example.com']
        )
      end.to raise_error(ArgumentError, /Redirect URL host is not allowed/)
    end

    it 'rejects prototype-chain event handler paths' do
      expect do
        helper.signwell_signing_iframe(
          url: 'https://www.signwell.com/sign',
          events: { completed: 'constructor.constructor' }
        )
      end.to raise_error(ArgumentError, /prototype-chain/)
    end
  end
end

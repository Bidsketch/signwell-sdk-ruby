# frozen_string_literal: true

require_relative 'view_helpers'

module SignWell
  module Embedded
    # Automatically includes {SignWell::Embedded::ViewHelpers} in Rails views.
    #
    # This Railtie is loaded conditionally - it is only required when
    # +Rails::Railtie+ is defined, so there is no hard dependency on Rails.
    #
    # @see SignWell::Embedded::ViewHelpers
    class Railtie < Rails::Railtie
      initializer 'signwell.view_helpers' do
        ActiveSupport.on_load(:action_view) do
          include SignWell::Embedded::ViewHelpers
        end
      end
    end
  end
end

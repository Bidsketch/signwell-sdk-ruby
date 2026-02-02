# frozen_string_literal: true

module SignwellSDK
  module Resources
    class V1
      class Hooks
        # @api private
        #
        # @param client [SignwellSDK::Client]
        def initialize(client:)
          @client = client
        end
      end
    end
  end
end

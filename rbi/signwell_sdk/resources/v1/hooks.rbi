# typed: strong

module SignwellSDK
  module Resources
    class V1
      class Hooks
        # @api private
        sig { params(client: SignwellSDK::Client).returns(T.attached_class) }
        def self.new(client:)
        end
      end
    end
  end
end

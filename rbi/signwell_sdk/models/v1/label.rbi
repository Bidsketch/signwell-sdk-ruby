# typed: strong

module SignwellSDK
  module Models
    module V1
      class Label < SignwellSDK::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(SignwellSDK::V1::Label, SignwellSDK::Internal::AnyHash)
          end

        sig { returns(String) }
        attr_accessor :name

        # Labels can be used to organize documents and templates in a way that can make it
        # easy to find using the document search/template search in SignWell. Labels can
        # be used to organize documents in a way that can make it easy to find using the
        # document search in SignWell.
        sig { params(name: String).returns(T.attached_class) }
        def self.new(name:)
        end

        sig { override.returns({ name: String }) }
        def to_hash
        end
      end
    end
  end
end

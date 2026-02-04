# typed: strong

module SignwellSDK
  module Models
    class ErrorResponse < SignwellSDK::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(SignwellSDK::ErrorResponse, SignwellSDK::Internal::AnyHash)
        end

      # Human-readable error message
      sig { returns(T.nilable(String)) }
      attr_reader :message

      sig { params(message: String).void }
      attr_writer :message

      sig { returns(T.nilable(SignwellSDK::ErrorResponse::Meta)) }
      attr_reader :meta

      sig { params(meta: SignwellSDK::ErrorResponse::Meta::OrHash).void }
      attr_writer :meta

      # Standard error response
      sig do
        params(
          message: String,
          meta: SignwellSDK::ErrorResponse::Meta::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Human-readable error message
        message: nil,
        meta: nil
      )
      end

      sig do
        override.returns(
          { message: String, meta: SignwellSDK::ErrorResponse::Meta }
        )
      end
      def to_hash
      end

      class Meta < SignwellSDK::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              SignwellSDK::ErrorResponse::Meta,
              SignwellSDK::Internal::AnyHash
            )
          end

        # Error code identifier
        sig { returns(String) }
        attr_accessor :error

        # Detailed error message
        sig { returns(String) }
        attr_accessor :message

        # List of error messages
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :messages

        sig { params(messages: T::Array[String]).void }
        attr_writer :messages

        sig do
          params(
            error: String,
            message: String,
            messages: T::Array[String]
          ).returns(T.attached_class)
        end
        def self.new(
          # Error code identifier
          error:,
          # Detailed error message
          message:,
          # List of error messages
          messages: nil
        )
        end

        sig do
          override.returns(
            { error: String, message: String, messages: T::Array[String] }
          )
        end
        def to_hash
        end
      end
    end
  end
end

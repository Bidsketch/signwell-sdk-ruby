# typed: strong

module SignwellSDK
  module Models
    module V1
      class DocumentListResponse < SignwellSDK::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              SignwellSDK::Models::V1::DocumentListResponse,
              SignwellSDK::Internal::AnyHash
            )
          end

        sig { returns(Integer) }
        attr_accessor :current_page

        sig { returns(T::Array[SignwellSDK::V1::Document]) }
        attr_accessor :documents

        sig { returns(Integer) }
        attr_accessor :total_count

        sig { returns(Integer) }
        attr_accessor :total_pages

        sig { returns(T.nilable(Integer)) }
        attr_accessor :next_page

        sig { returns(T.nilable(Integer)) }
        attr_accessor :previous_page

        # List of documents with pagination
        sig do
          params(
            current_page: Integer,
            documents: T::Array[SignwellSDK::V1::Document::OrHash],
            total_count: Integer,
            total_pages: Integer,
            next_page: T.nilable(Integer),
            previous_page: T.nilable(Integer)
          ).returns(T.attached_class)
        end
        def self.new(
          current_page:,
          documents:,
          total_count:,
          total_pages:,
          next_page: nil,
          previous_page: nil
        )
        end

        sig do
          override.returns(
            {
              current_page: Integer,
              documents: T::Array[SignwellSDK::V1::Document],
              total_count: Integer,
              total_pages: Integer,
              next_page: T.nilable(Integer),
              previous_page: T.nilable(Integer)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end

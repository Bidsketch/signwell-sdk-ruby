# frozen_string_literal: true

require_relative "../../test_helper"

class SignwellSDK::Test::Resources::V1::DocumentsTest < SignwellSDK::Test::ResourceTest
  def test_list
    skip("Prism tests are disabled")

    response = @signwell_sdk.v1.documents.list

    assert_pattern do
      response => SignwellSDK::Models::V1::DocumentListResponse
    end

    assert_pattern do
      response => {
        current_page: Integer,
        documents: ^(SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::Document]),
        total_count: Integer,
        total_pages: Integer,
        next_page: Integer | nil,
        previous_page: Integer | nil
      }
    end
  end

  def test_remind
    skip("Prism tests are disabled")

    response = @signwell_sdk.v1.documents.remind("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => nil
    end
  end

  def test_retrieve_nom151_certificate
    skip("Prism tests are disabled")

    response = @signwell_sdk.v1.documents.retrieve_nom151_certificate("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => SignwellSDK::Models::V1::DocumentRetrieveNom151CertificateResponse
    end

    assert_pattern do
      case response
      in SignwellSDK::Models::V1::DocumentRetrieveNom151CertificateResponse::Nom151CertificateResponse
      in SignwellSDK::Models::V1::DocumentRetrieveNom151CertificateResponse::Nom151URLResponse
      in StringIO
      end
    end
  end
end

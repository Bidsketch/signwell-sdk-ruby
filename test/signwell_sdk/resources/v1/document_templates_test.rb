# frozen_string_literal: true

require_relative "../../test_helper"

class SignwellSDK::Test::Resources::V1::DocumentTemplatesTest < SignwellSDK::Test::ResourceTest
  def test_list
    skip("Prism tests are disabled")

    response = @signwell_sdk.v1.document_templates.list

    assert_pattern do
      response => SignwellSDK::Models::V1::DocumentTemplateListResponse
    end

    assert_pattern do
      response => {
        current_page: Integer,
        templates: ^(SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::DocumentTemplate]),
        total_count: Integer,
        total_pages: Integer,
        next_page: Integer | nil,
        previous_page: Integer | nil
      }
    end
  end
end

# frozen_string_literal: true

require_relative "../../test_helper"

class SignwellSDK::Test::Resources::V1::DocumentTemplatesTest < SignwellSDK::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response =
      @signwell_sdk.v1.document_templates.create(
        files: [{name: "name"}],
        placeholders: [{id: "id", name: "name"}]
      )

    assert_pattern do
      response => SignwellSDK::V1::DocumentTemplate
    end

    assert_pattern do
      response => {
        id: String,
        allow_decline: SignwellSDK::Internal::Type::Boolean | nil,
        allow_reassign: SignwellSDK::Internal::Type::Boolean | nil,
        api_application_id: String | nil,
        apply_signing_order: SignwellSDK::Internal::Type::Boolean | nil,
        archived: SignwellSDK::Internal::Type::Boolean | nil,
        checkbox_groups: ^(SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::DocumentTemplate::CheckboxGroup]) | nil,
        copied_placeholders: ^(SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::DocumentTemplate::CopiedPlaceholder]) | nil,
        created_at: Time | nil,
        custom_requester_email: String | nil,
        custom_requester_name: String | nil,
        decline_redirect_url: String | nil,
        expires_in: Integer | nil,
        fields: ^(SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::DocumentTemplate::Field]]) | nil,
        files: ^(SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::DocumentTemplate::File]) | nil,
        labels: ^(SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::DocumentTemplate::Label]) | nil,
        language: String | nil,
        message: String | nil,
        metadata: ^(SignwellSDK::Internal::Type::HashOf[String]) | nil,
        name: String | nil,
        placeholders: ^(SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::DocumentTemplate::Placeholder]) | nil,
        redirect_url: String | nil,
        reminders: SignwellSDK::Internal::Type::Boolean | nil,
        requester_email_address: String | nil,
        status: String | nil,
        subject: String | nil,
        template_link: String | nil,
        updated_at: Time | nil
      }
    end
  end

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

  def test_delete
    skip("Prism tests are disabled")

    response = @signwell_sdk.v1.document_templates.delete("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => nil
    end
  end

  def test_retrieve
    skip("Prism tests are disabled")

    response = @signwell_sdk.v1.document_templates.retrieve("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => SignwellSDK::V1::DocumentTemplate
    end

    assert_pattern do
      response => {
        id: String,
        allow_decline: SignwellSDK::Internal::Type::Boolean | nil,
        allow_reassign: SignwellSDK::Internal::Type::Boolean | nil,
        api_application_id: String | nil,
        apply_signing_order: SignwellSDK::Internal::Type::Boolean | nil,
        archived: SignwellSDK::Internal::Type::Boolean | nil,
        checkbox_groups: ^(SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::DocumentTemplate::CheckboxGroup]) | nil,
        copied_placeholders: ^(SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::DocumentTemplate::CopiedPlaceholder]) | nil,
        created_at: Time | nil,
        custom_requester_email: String | nil,
        custom_requester_name: String | nil,
        decline_redirect_url: String | nil,
        expires_in: Integer | nil,
        fields: ^(SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::DocumentTemplate::Field]]) | nil,
        files: ^(SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::DocumentTemplate::File]) | nil,
        labels: ^(SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::DocumentTemplate::Label]) | nil,
        language: String | nil,
        message: String | nil,
        metadata: ^(SignwellSDK::Internal::Type::HashOf[String]) | nil,
        name: String | nil,
        placeholders: ^(SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::DocumentTemplate::Placeholder]) | nil,
        redirect_url: String | nil,
        reminders: SignwellSDK::Internal::Type::Boolean | nil,
        requester_email_address: String | nil,
        status: String | nil,
        subject: String | nil,
        template_link: String | nil,
        updated_at: Time | nil
      }
    end
  end

  def test_update
    skip("Prism tests are disabled")

    response = @signwell_sdk.v1.document_templates.update("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => SignwellSDK::V1::DocumentTemplate
    end

    assert_pattern do
      response => {
        id: String,
        allow_decline: SignwellSDK::Internal::Type::Boolean | nil,
        allow_reassign: SignwellSDK::Internal::Type::Boolean | nil,
        api_application_id: String | nil,
        apply_signing_order: SignwellSDK::Internal::Type::Boolean | nil,
        archived: SignwellSDK::Internal::Type::Boolean | nil,
        checkbox_groups: ^(SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::DocumentTemplate::CheckboxGroup]) | nil,
        copied_placeholders: ^(SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::DocumentTemplate::CopiedPlaceholder]) | nil,
        created_at: Time | nil,
        custom_requester_email: String | nil,
        custom_requester_name: String | nil,
        decline_redirect_url: String | nil,
        expires_in: Integer | nil,
        fields: ^(SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::DocumentTemplate::Field]]) | nil,
        files: ^(SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::DocumentTemplate::File]) | nil,
        labels: ^(SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::DocumentTemplate::Label]) | nil,
        language: String | nil,
        message: String | nil,
        metadata: ^(SignwellSDK::Internal::Type::HashOf[String]) | nil,
        name: String | nil,
        placeholders: ^(SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::DocumentTemplate::Placeholder]) | nil,
        redirect_url: String | nil,
        reminders: SignwellSDK::Internal::Type::Boolean | nil,
        requester_email_address: String | nil,
        status: String | nil,
        subject: String | nil,
        template_link: String | nil,
        updated_at: Time | nil
      }
    end
  end
end

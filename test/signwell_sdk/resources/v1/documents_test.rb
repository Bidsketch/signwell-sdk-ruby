# frozen_string_literal: true

require_relative "../../test_helper"

class SignwellSDK::Test::Resources::V1::DocumentsTest < SignwellSDK::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response =
      @signwell_sdk.v1.documents.create(
        files: [{name: "name"}],
        recipients: [{id: "id", email: "dev@stainless.com"}]
      )

    assert_pattern do
      response => SignwellSDK::V1::Document
    end

    assert_pattern do
      response => {
        id: String,
        test_mode: SignwellSDK::Internal::Type::Boolean,
        allow_decline: SignwellSDK::Internal::Type::Boolean | nil,
        allow_reassign: SignwellSDK::Internal::Type::Boolean | nil,
        api_application_id: String | nil,
        apply_signing_order: SignwellSDK::Internal::Type::Boolean | nil,
        archived: SignwellSDK::Internal::Type::Boolean | nil,
        attachment_requests: ^(SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::Document::AttachmentRequest]) | nil,
        checkbox_groups: ^(SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::Document::CheckboxGroup]) | nil,
        copied_contacts: ^(SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::Document::CopiedContact]) | nil,
        created_at: Time | nil,
        custom_requester_email: String | nil,
        custom_requester_name: String | nil,
        decline_redirect_url: String | nil,
        embedded: SignwellSDK::Internal::Type::Boolean | nil,
        embedded_edit_url: String | nil,
        embedded_preview_url: String | nil,
        expires_in: Integer | nil,
        fields: ^(SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::Document::Field]]) | nil,
        files: ^(SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::Document::File]) | nil,
        labels: ^(SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::Document::Label]) | nil,
        language: String | nil,
        message: String | nil,
        metadata: ^(SignwellSDK::Internal::Type::HashOf[String]) | nil,
        name: String | nil,
        recipients: ^(SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::Document::Recipient]) | nil,
        redirect_url: String | nil,
        reminders: SignwellSDK::Internal::Type::Boolean | nil,
        requester_email_address: String | nil,
        status: String | nil,
        subject: String | nil,
        updated_at: Time | nil
      }
    end
  end

  def test_retrieve
    skip("Prism tests are disabled")

    response = @signwell_sdk.v1.documents.retrieve("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => SignwellSDK::V1::Document
    end

    assert_pattern do
      response => {
        id: String,
        test_mode: SignwellSDK::Internal::Type::Boolean,
        allow_decline: SignwellSDK::Internal::Type::Boolean | nil,
        allow_reassign: SignwellSDK::Internal::Type::Boolean | nil,
        api_application_id: String | nil,
        apply_signing_order: SignwellSDK::Internal::Type::Boolean | nil,
        archived: SignwellSDK::Internal::Type::Boolean | nil,
        attachment_requests: ^(SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::Document::AttachmentRequest]) | nil,
        checkbox_groups: ^(SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::Document::CheckboxGroup]) | nil,
        copied_contacts: ^(SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::Document::CopiedContact]) | nil,
        created_at: Time | nil,
        custom_requester_email: String | nil,
        custom_requester_name: String | nil,
        decline_redirect_url: String | nil,
        embedded: SignwellSDK::Internal::Type::Boolean | nil,
        embedded_edit_url: String | nil,
        embedded_preview_url: String | nil,
        expires_in: Integer | nil,
        fields: ^(SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::Document::Field]]) | nil,
        files: ^(SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::Document::File]) | nil,
        labels: ^(SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::Document::Label]) | nil,
        language: String | nil,
        message: String | nil,
        metadata: ^(SignwellSDK::Internal::Type::HashOf[String]) | nil,
        name: String | nil,
        recipients: ^(SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::Document::Recipient]) | nil,
        redirect_url: String | nil,
        reminders: SignwellSDK::Internal::Type::Boolean | nil,
        requester_email_address: String | nil,
        status: String | nil,
        subject: String | nil,
        updated_at: Time | nil
      }
    end
  end

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

  def test_delete
    skip("Prism tests are disabled")

    response = @signwell_sdk.v1.documents.delete("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => nil
    end
  end

  def test_create_from_template_required_params
    skip("Prism tests are disabled")

    response =
      @signwell_sdk.v1.documents.create_from_template(recipients: [{id: "id", email: "dev@stainless.com"}])

    assert_pattern do
      response => SignwellSDK::Models::V1::DocumentCreateFromTemplateResponse
    end

    assert_pattern do
      response => {
        id: String,
        test_mode: SignwellSDK::Internal::Type::Boolean,
        allow_decline: SignwellSDK::Internal::Type::Boolean | nil,
        allow_reassign: SignwellSDK::Internal::Type::Boolean | nil,
        api_application_id: String | nil,
        apply_signing_order: SignwellSDK::Internal::Type::Boolean | nil,
        archived: SignwellSDK::Internal::Type::Boolean | nil,
        attachment_requests: ^(SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::Models::V1::DocumentCreateFromTemplateResponse::AttachmentRequest]) | nil,
        copied_contacts: ^(SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::Models::V1::DocumentCreateFromTemplateResponse::CopiedContact]) | nil,
        created_at: Time | nil,
        custom_requester_email: String | nil,
        custom_requester_name: String | nil,
        decline_redirect_url: String | nil,
        embedded: SignwellSDK::Internal::Type::Boolean | nil,
        embedded_edit_url: String | nil,
        expires_in: Integer | nil,
        fields: ^(SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::Models::V1::DocumentCreateFromTemplateResponse::Field]]) | nil,
        files: ^(SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::Models::V1::DocumentCreateFromTemplateResponse::File]) | nil,
        labels: ^(SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::Models::V1::DocumentCreateFromTemplateResponse::Label]) | nil,
        language: String | nil,
        message: String | nil,
        metadata: ^(SignwellSDK::Internal::Type::HashOf[String]) | nil,
        name: String | nil,
        recipients: ^(SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::Models::V1::DocumentCreateFromTemplateResponse::Recipient]) | nil,
        redirect_url: String | nil,
        reminders: SignwellSDK::Internal::Type::Boolean | nil,
        requester_email_address: String | nil,
        status: String | nil,
        subject: String | nil,
        template_id: String | nil,
        template_ids: ^(SignwellSDK::Internal::Type::ArrayOf[String]) | nil,
        updated_at: Time | nil
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

  def test_retrieve_completed_pdf
    skip("Prism tests are disabled")

    response = @signwell_sdk.v1.documents.retrieve_completed_pdf("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => SignwellSDK::Models::V1::DocumentRetrieveCompletedPdfResponse
    end

    assert_pattern do
      case response
      in SignwellSDK::Models::V1::DocumentRetrieveCompletedPdfResponse::Json
      in StringIO
      end
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

  def test_send_
    skip("Prism tests are disabled")

    response = @signwell_sdk.v1.documents.send_("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => SignwellSDK::V1::Document
    end

    assert_pattern do
      response => {
        id: String,
        test_mode: SignwellSDK::Internal::Type::Boolean,
        allow_decline: SignwellSDK::Internal::Type::Boolean | nil,
        allow_reassign: SignwellSDK::Internal::Type::Boolean | nil,
        api_application_id: String | nil,
        apply_signing_order: SignwellSDK::Internal::Type::Boolean | nil,
        archived: SignwellSDK::Internal::Type::Boolean | nil,
        attachment_requests: ^(SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::Document::AttachmentRequest]) | nil,
        checkbox_groups: ^(SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::Document::CheckboxGroup]) | nil,
        copied_contacts: ^(SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::Document::CopiedContact]) | nil,
        created_at: Time | nil,
        custom_requester_email: String | nil,
        custom_requester_name: String | nil,
        decline_redirect_url: String | nil,
        embedded: SignwellSDK::Internal::Type::Boolean | nil,
        embedded_edit_url: String | nil,
        embedded_preview_url: String | nil,
        expires_in: Integer | nil,
        fields: ^(SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::Document::Field]]) | nil,
        files: ^(SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::Document::File]) | nil,
        labels: ^(SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::Document::Label]) | nil,
        language: String | nil,
        message: String | nil,
        metadata: ^(SignwellSDK::Internal::Type::HashOf[String]) | nil,
        name: String | nil,
        recipients: ^(SignwellSDK::Internal::Type::ArrayOf[SignwellSDK::V1::Document::Recipient]) | nil,
        redirect_url: String | nil,
        reminders: SignwellSDK::Internal::Type::Boolean | nil,
        requester_email_address: String | nil,
        status: String | nil,
        subject: String | nil,
        updated_at: Time | nil
      }
    end
  end
end

# frozen_string_literal: true

require_relative "../../test_helper"

class SignwellSDK::Test::Resources::V1::BulkSendsTest < SignwellSDK::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response =
      @signwell_sdk.v1.bulk_sends.create(
        bulk_send_csv: "U3RhaW5sZXNzIHJvY2tz",
        template_ids: ["182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e"]
      )

    assert_pattern do
      response => nil
    end
  end

  def test_retrieve
    skip("Prism tests are disabled")

    response = @signwell_sdk.v1.bulk_sends.retrieve("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => nil
    end
  end

  def test_list
    skip("Prism tests are disabled")

    response = @signwell_sdk.v1.bulk_sends.list

    assert_pattern do
      response => nil
    end
  end

  def test_retrieve_csv_template_required_params
    skip("Prism doesn't support application/octet-stream responses")

    response =
      @signwell_sdk.v1.bulk_sends.retrieve_csv_template(template_ids: ["182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e"])

    assert_pattern do
      response => StringIO
    end
  end

  def test_retrieve_documents
    skip("Prism tests are disabled")

    response = @signwell_sdk.v1.bulk_sends.retrieve_documents("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => nil
    end
  end

  def test_validate_csv_required_params
    skip("Prism tests are disabled")

    response =
      @signwell_sdk.v1.bulk_sends.validate_csv(
        bulk_send_csv: "U3RhaW5sZXNzIHJvY2tz",
        template_ids: ["182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e"]
      )

    assert_pattern do
      response => nil
    end
  end
end

# frozen_string_literal: true

require_relative "../../test_helper"

class SignwellSDK::Test::Resources::V1::HooksTest < SignwellSDK::Test::ResourceTest
  def test_update_required_params
    skip("Prism tests are disabled")

    response = @signwell_sdk.v1.hooks.update(callback_url: "callback_url")

    assert_pattern do
      response => nil
    end
  end

  def test_delete
    skip("Prism tests are disabled")

    response = @signwell_sdk.v1.hooks.delete("182bd5e5-6e1a-4fe4-a799-aa6d9a6ab26e")

    assert_pattern do
      response => nil
    end
  end

  def test_retrieve
    skip("Prism tests are disabled")

    response = @signwell_sdk.v1.hooks.retrieve

    assert_pattern do
      response => nil
    end
  end
end

# frozen_string_literal: true

require_relative "../../test_helper"

class SignwellSDK::Test::Resources::V1::HooksTest < SignwellSDK::Test::ResourceTest
  def test_create_required_params
    skip("Prism tests are disabled")

    response = @signwell_sdk.v1.hooks.create(callback_url: "callback_url")

    assert_pattern do
      response => nil
    end
  end

  def test_list
    skip("Prism tests are disabled")

    response = @signwell_sdk.v1.hooks.list

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
end

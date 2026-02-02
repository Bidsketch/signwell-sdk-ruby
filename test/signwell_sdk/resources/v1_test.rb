# frozen_string_literal: true

require_relative "../test_helper"

class SignwellSDK::Test::Resources::V1Test < SignwellSDK::Test::ResourceTest
  def test_retrieve
    skip("Prism tests are disabled")

    response = @signwell_sdk.v1.retrieve

    assert_pattern do
      response => nil
    end
  end
end

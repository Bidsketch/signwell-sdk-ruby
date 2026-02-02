# frozen_string_literal: true

require_relative "../test_helper"

class SignwellSDK::Test::Resources::V1Test < SignwellSDK::Test::ResourceTest
  def test_me
    skip("Prism tests are disabled")

    response = @signwell_sdk.v1.me

    assert_pattern do
      response => nil
    end
  end
end

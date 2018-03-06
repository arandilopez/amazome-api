require 'test_helper'

class RegisterControllerTest < ActionDispatch::IntegrationTest
  test "should register new user" do
    assert_difference("User.count", 1) do
      post register_url, params: {
        user: { name: "Fulano", email: "fulano@example.com", password: "fulano123", password_confirmation: "fulano123" }
      }, as: :json
    end
    assert_response :created
    assert json_response['token'].present?
  end

end
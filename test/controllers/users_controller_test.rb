require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = create(:admin)
    @users = create_list(:user, 10)
    @user = create(:user)
  end

  test "should get index" do
    get users_url, as: :json, headers: authenticated_header(@admin)
    assert_response :success
    assert_equal 12, json_response.size
  end

  test "should create new user" do
    assert_difference("User.count", 1) do
      post users_url, params: {
        user: {name: "Fulano", email: "fulano@example.com", password: "fulano123", password_confirmation: "fulano123"}
        }, as: :json, headers: authenticated_header(@admin)
    end
    assert_response :created
    @user = User.last
    assert_equal "Fulano", @user.name
  end

  test "should get user" do
    get user_url(@user), as: :json, headers: authenticated_header(@admin)
    assert_response :success
    assert_not json_response.include? 'password_digest'
  end

  test "should update user info" do
    assert_no_difference("User.count") do
      patch user_url(@user), params: {
        user: {name: "Fulano", email: "fulano@example.com"}
        }, as: :json, headers: authenticated_header(@admin)
    end
    assert_response :success
    @user.reload
    assert_equal "Fulano", @user.name
  end

  test "should delete user" do
    assert_difference('User.count', -1) do
      delete user_url(@user), as: :json, headers: authenticated_header(@admin)
    end

    assert_response :no_content
  end

  test "should get current user" do
    get current_users_url, as: :json, headers: authenticated_header(@user)
    assert_response :success
    assert_equal @user.id, json_response['id']
  end

end

require 'test_helper'

class WishListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user_with_wish_lists_and_products, wish_lists_count: 2, products_count: 3)
    @wish_list = @user.wish_lists.first
  end

  test "should get index" do
    get wish_lists_url, as: :json, headers: authenticated_header(@user)
    assert_response :success
    assert_equal 2, json_response.size
  end

  test "should create wish_list" do
    assert_difference('WishList.count') do
      post wish_lists_url, params: { wish_list: { name: 'Kitchen Stuffs' } }, as: :json, headers: authenticated_header(@user)
    end
    assert_response :created
    wish_list = WishList.last
    assert_equal "Kitchen Stuffs", wish_list.name
    assert_equal @user.id, wish_list.user.id
  end

  test "should show wish_list" do
    get wish_list_url(@wish_list), as: :json, headers: authenticated_header(@user)
    assert_response :success
    assert_equal @wish_list.id, json_response['id']
  end

  test "should update wish_list" do
    assert_no_difference("WishList.count") do
      patch wish_list_url(@wish_list), params: { wish_list: { name: @wish_list.name } }, as: :json, headers: authenticated_header(@user)
    end
    assert_response :success
  end

  test "should destroy wish_list" do
    assert_difference('WishList.count', -1) do
      delete wish_list_url(@wish_list), as: :json, headers: authenticated_header(@user)
    end

    assert_response :no_content
  end
end

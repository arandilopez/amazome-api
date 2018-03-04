require 'test_helper'

class WishListProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user_with_wish_lists_and_products, wish_lists_count: 1, products_count: 10)
    @wish_list = @user.wish_lists.first
    @product = create(:product)
  end
  test "should get products added in wish list" do
    get wish_list_products_url(@wish_list), as: :json, headers: authenticated_header(@user)
    assert_response :success
    assert_equal 10, json_response.size
  end

  test "should add a product to wish list" do
    assert_difference([->{ @wish_list.products.size }], 1) do
      post wish_list_products_url(@wish_list), params: {
        product: { id: @product.id }
        }, as: :json, headers: authenticated_header(@user)
    end
    assert_response :created
  end

  test "should remove a product from wish list" do
    @product = @wish_list.products.last
    assert_difference([->{ @wish_list.products.size }], -1) do
      delete wish_list_product_url(@wish_list, @product), as: :json, headers: authenticated_header(@user)
    end
    assert_response :no_content
  end

end

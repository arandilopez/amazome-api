require 'test_helper'

class CartControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = create(:user_with_cart_and_products, products_count: 10)
    @cart = @user.cart
    @product = create(:product)
  end

  test "should get index" do
    get cart_index_url, as: :json, headers: authenticated_header(@user)
    assert_response :success
    assert_equal 10, @cart.products.size
  end

  test "should create new record for product" do
    assert @product.is_a? Product
    # assert_difference([->{ @cart.products.size }], 1) do
      post cart_index_url, params: {
        product: { id: @product.id }
        }, as: :json, headers: authenticated_header(@user)
    # end
    assert_response :created
  end

  test "should destroy a record of product in cart" do
    @product = @cart.products.last
    # assert_difference([->{ @cart.products.size }], -1) do
      delete cart_url(@product.id), as: :json, headers: authenticated_header(@user)
    # end
    assert_response :no_content
  end
end

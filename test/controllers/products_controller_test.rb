require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = create(:product)
  end

  test "should get index" do
    get products_url, as: :json
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post products_url, params: { product: {
        description: 'Item', name: 'Item', price: 2.3, sku: '123456789' }
      }, as: :json
    end

    assert_response 201
  end

  test "should show product" do
    get product_url(@product), as: :json
    assert_response :success
  end

  test "should update product" do
    patch product_url(@product), params: {
      product: { name: "#{@product.name} nuevo", price: @product.price + 1 }
    }, as: :json
    assert_response 200
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete product_url(@product), as: :json
    end

    assert_response 204
  end
end

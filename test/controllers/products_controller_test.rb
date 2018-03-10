require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = create(:product, name: "Coca Cola")
    @product2 = create(:product, name: "Coca Cola light")
    @products = create_list(:product, 20)
  end

  test "should get index" do
    get products_url, as: :json
    assert_response :success
    assert_equal 22, json_response.size
  end

  test "should get index with limit" do
    get products_url, params: {limit: 10}
    assert_response :success
    assert_equal 10, json_response.size
  end

  test "should get index with filter" do
    get products_url, params: {filter: "coca"}
    assert_response :success
    assert_equal 2, json_response.size
  end

  test "should get index with filter and limit" do
    get products_url, params: {filter: "coca", limit: 1}
    assert_response :success
    assert_equal 1, json_response.size
  end

  test "should create product" do
    assert_difference('Product.count') do
      post products_url, params: { product: {
        description: 'Item', name: 'Item', price: 2.3, sku: '123456789' }
      }, as: :json, headers: authenticated_header(create(:admin))
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
    }, as: :json, headers: authenticated_header( create(:admin) )
    assert_response 200
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete product_url(@product), as: :json, headers: authenticated_header( create(:admin) )
    end

    assert_response 204
  end
end

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "search scope" do
    @product = create(:product, name: "Coke")
    result = Product.all.search("Cok")
    assert_equal 1, result.size
    assert_equal @product, result.first
  end

  test "search scope allow nil params and doesnt fail" do
    @product = create(:product, name: "Coke")
    create_list(:product, 10)
    result = Product.all.search(nil)
    assert_equal 11, result.size
  end
end

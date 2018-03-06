require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "created user has a cart" do
    @user = create(:user_with_cart_and_products, products_count: 10)
    assert @user.cart.present?
    assert @user.cart.products.present?
    assert_equal 10, @user.cart.products.size
  end

  test "user factory" do
    @user = build(:user)
    assert @user.valid?
  end

  test "admin factory" do
    @admin = build(:admin)
    assert @admin.valid?
  end
end

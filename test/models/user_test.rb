require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user factory" do
    @user = build(:user)
    assert @user.valid?
  end

  test "admin factory" do
    @admin = build(:admin)
    assert @admin.valid?
  end
end

class User < ApplicationRecord
  include ActiveModel::Validations
  validates_presence_of :name
  validates :email, uniqueness: true, presence: true, email: true
  has_secure_password
  has_one :cart, dependent: :destroy
  has_many :wish_lists
  enum role: %i{user admin}

  after_create do
    self.create_cart if self.cart.blank?
  end
end

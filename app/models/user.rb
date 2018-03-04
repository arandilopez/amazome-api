class User < ApplicationRecord
  include ActiveModel::Validations
  has_secure_password
  validates :email, uniqueness: true, presence: true, email: true
  validates_presence_of :name
  has_many :wish_lists
  has_one :cart
  enum role: [:user, :admin]
end

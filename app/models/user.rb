class User < ApplicationRecord
  include ActiveModel::Validations
  validates :email, uniqueness: true, presence: true, email: true
  validates_presence_of :name
  enum role: [:user, :admin]
  has_secure_password
end

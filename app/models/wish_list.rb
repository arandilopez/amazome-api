class WishList < ApplicationRecord
  validates_presence_of :name
  belongs_to :user
  has_and_belongs_to_many :products
end

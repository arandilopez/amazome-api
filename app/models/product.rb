class Product < ApplicationRecord
  validates :sku, presence: true, uniqueness: true
  validates :name, presence: true
  validates :price, presence: true, numericality: true
  has_and_belongs_to_many :wish_lists
end

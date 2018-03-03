class Product < ApplicationRecord
  validate :sku, presence: true, uniqueness: true
  validates_presence_of :name
  validate :price, presence: true, numerically: true
end

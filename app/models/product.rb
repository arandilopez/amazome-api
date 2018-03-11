class Product < ApplicationRecord
  validates :sku, presence: true, uniqueness: true
  validates :name, presence: true
  validates :price, presence: true, numericality: true
  has_and_belongs_to_many :wish_lists
  has_and_belongs_to_many :carts

  scope :search, -> (filter) do
    where('sku ilike :filter OR name ilike :filter OR description ilike :filter', filter: "%#{filter}%") if filter.present?
  end
end

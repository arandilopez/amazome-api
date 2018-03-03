FactoryBot.define do
  factory :product do
    sku { Faker::Code.unique.isbn }
    name { Faker::Commerce.product_name }
    description { Faker::Commerce.department }
    price { Faker::Commerce.price }
  end
end

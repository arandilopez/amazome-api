FactoryBot.define do
  factory :product do
    sku { Faker::Code.unique.isbn }
    name { Faker::Commerce.product_name }
    description { Faker::Commerce.department }
    price { Faker::Commerce.price }
    image { Faker::LoremPixel.image("512x512") }
  end
end

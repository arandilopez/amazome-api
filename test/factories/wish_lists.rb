FactoryBot.define do
  factory :wish_list do
    name { Faker::Commerce.department(2, true) }
    user

    factory :wish_list_with_products do
      transient do
        products_count 5
      end
      after(:create) do |wish_list, evaluator|
        create_list(:product, evaluator.products_count, wish_lists: [wish_list])
      end
    end
  end
end

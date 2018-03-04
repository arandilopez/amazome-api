FactoryBot.define do
  factory :cart do
    user

    factory :cart_with_products do
      transient do
        products_count 5
      end
      after(:create) do |cart, evaluator|
        create_list(:product, evaluator.products_count, carts: [cart])
      end
    end
  end
end

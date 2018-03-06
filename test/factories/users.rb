FactoryBot.define do
  factory :user do
    name { Faker::Simpsons.character }
    email { Faker::Internet.unique.safe_email }
    role 0
    after(:build) { |user|
      user.password = "user123"
      user.password_confirmation = "user123"
    }

    factory :user_with_wish_lists_and_products do
      transient do
        wish_lists_count 5
        products_count 5
      end

      after(:create) do |user, evaluator|
        create_list(:wish_list_with_products, evaluator.wish_lists_count, user: user, products_count: evaluator.products_count)
      end
    end

    factory :user_with_cart_and_products do
      transient do
        products_count 5
      end

      after(:create) do |user, evaluator|
        create(:cart_with_products, user: user, products_count: evaluator.products_count)
      end
    end
  end

  factory :admin, class: User do
    name "Sys Admin"
    email "sysadmin@example.com"
    role 1
    after(:build) { |user|
      user.password = "admin123"
      user.password_confirmation = "admin123"
    }
  end
end

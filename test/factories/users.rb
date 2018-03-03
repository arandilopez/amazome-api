FactoryBot.define do
  factory :user do
    name { Faker::Simpsons.character }
    email { Faker::Internet.unique.safe_email }
    role 0
    after(:build) { |user|
      user.password = "user123"
      user.password_confirmation = "user123"
    }
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

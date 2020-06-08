FactoryBot.define do
  factory :user do
    id { 1 }
    name {"test-user"}
    email {"test@test.jp"}
    password {"testtest"}

    trait :invalid do
      name {nil}
    end
  end
end

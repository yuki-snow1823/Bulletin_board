FactoryBot.define do
  factory :post do
    title {"test"}
    context {"hogehoge"}
    association :user, factory: :user

    trait :invalid do
      title {nil}
    end
  end
end

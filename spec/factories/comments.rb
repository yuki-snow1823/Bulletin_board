FactoryBot.define do
  factory :comment do
    context {"hogehoge"}
    association :user, factory: :user
    association :post, factory: :post

    trait :invalid do
      title {nil}
    end
  end
end

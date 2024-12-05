FactoryBot.define do
  factory :case_item do
    uuid { SecureRandom.uuid }
    association :case, factory: :case
    sequence(:item_order, 1000) { |n| n }
    title { "MyString" }
    description { "MyString" }
    metadata { {} }
    code { "MyString" }
    source { "case_manager:api" }
    category { "labor" }
    quantity { 1 }
    unit_of_measure { "each" }
    unit_price { 100 }
    association :created_by_user, factory: :user
    association :updated_by_user, factory: :user
    discarded_at { nil }
  end
end

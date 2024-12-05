FactoryBot.define do
  factory :business do
    uuid { SecureRandom.uuid }
    category { "MyString" }
    name { "MyString" }
    description { "MyString" }
    association :primary_location, factory: :business_location
    brand_identifier { "MyString" }
    metadata { "" }
    association :created_by_user, factory: :user
    association :updated_by_user, factory: :user
    discarded_at { nil }
  end
end

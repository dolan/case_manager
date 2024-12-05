FactoryBot.define do
  factory :customer do
    uuid { SecureRandom.uuid }
    association :business_location, factory: :business_location
    display_name { Faker::Name.name }
    description { Faker::Lorem.sentence }
    metadata { {} }
    association :created_by_user, factory: :user
    association :updated_by_user, factory: :user
    discarded_at { nil }
  end
end

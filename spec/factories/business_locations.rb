FactoryBot.define do
  factory :business_location do
    uuid { SecureRandom.uuid }
    association :business, factory: :business
    association :location, factory: :location
    association :created_by_user, factory: :user
    metadata { {} }
    discarded_at { nil }
  end
end

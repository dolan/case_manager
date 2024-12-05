FactoryBot.define do
  factory :asset do
    uuid { SecureRandom.uuid }
    association :asset_identity, factory: :asset_identity
    association :business_location, factory: :business_location
    association :created_by_user, factory: :user
    association :updated_by_user, factory: :user
    discarded_at { nil }
  end
end

FactoryBot.define do
  factory :case do
    uuid { SecureRandom.uuid }
    reference_number { Faker::Number.unique.number(digits: 6) }
    complaint { "Broken Window" }
    association :asset, factory: :asset
    association :service_provider_business_location, factory: :business_location
    association :ship_to_customer, factory: :customer
    association :bill_to_customer, factory: :customer
    association :assigned_to_user, factory: :user
    source { "case_manager:api" }
    association :created_by_user, factory: :user
    association :updated_by_user, factory: :user
    estimated_complete_at { Time.current }
    actual_completed_at { Time.current }
    next_follow_up_at { Time.current }
    checked_in_at { Time.current }
    discarded_at { nil }
    metadata { {} }
  end
end

FactoryBot.define do
  factory :case_activity do
    uuid { SecureRandom.uuid }
    association :case, factory: :case
    title { "Case Activity Title" }
    description { "Case Activity Description" }
    category { "note" }
    occurred_at { Time.current }
    association :actor_user, factory: :user
    association :target_user, factory: :user
    audience_category { "service_provider" }
    metadata { {} }
    association :created_by_user, factory: :user
    association :updated_by_user, factory: :user
    discarded_at { nil }
  end
end

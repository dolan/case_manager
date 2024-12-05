FactoryBot.define do
  factory :security_role do
    uuid { SecureRandom.uuid }
    name { "Generic User Role" }
    category { "user" }
    association :created_by_user, factory: :user
    association :updated_by_user, factory: :user
    discarded_at { nil }
  end
end

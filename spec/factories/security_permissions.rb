FactoryBot.define do
  factory :security_permission do
    uuid { SecureRandom.uuid }
    name { "businesses.list" }
    association :created_by_user, factory: :user
    created_at { "2024-11-28 10:35:07" }
  end
end

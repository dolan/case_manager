FactoryBot.define do
  factory :user_role_assignment do
    uuid { SecureRandom.uuid }
    association :user, factory: :user
    association :security_role, factory: :security_role
    association :created_by_user, factory: :user
    discarded_at { nil }
  end
end

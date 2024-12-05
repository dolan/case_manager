FactoryBot.define do
  factory :group_role_assignment do
    uuid { SecureRandom.uuid }
    association :group, factory: :group
    association :security_role, factory: :security_role
    association :created_by_user, factory: :user
    discarded_at { nil }
  end
end

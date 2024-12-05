FactoryBot.define do
  factory :security_role_permission do
    uuid { SecureRandom.uuid }
    association :security_permission, factory: :security_permission
    association :security_role, factory: :security_role
    association :created_by_user, factory: :user
    created_at { Faker::Time.between(from: 1.day.ago, to: Time.now) }
  end
end

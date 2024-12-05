FactoryBot.define do
  factory :user_group_membership do
    uuid { SecureRandom.uuid }
    association :user, factory: :user
    association :group, factory: :group
    association :created_by_user, factory: :user
    association :updated_by_user, factory: :user
    discarded_at { nil }
  end
end

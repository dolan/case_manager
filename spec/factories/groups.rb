FactoryBot.define do
  factory :group do
    uuid { SecureRandom.uuid }
    name { "#{Faker::Lorem.word} Group" }
    category { "security" }
    association :created_by_user, factory: :user
    association :updated_by_user, factory: :user
    discarded_at { nil }
  end
end

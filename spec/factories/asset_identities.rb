FactoryBot.define do
  factory :asset_identity do
    uuid { SecureRandom.uuid }
    make { "NoMake" }
    model { "NoModel" }
    year { Faker::Number.between(from: 1900, to: 2024) }
    serial_number { nil }
    vin { nil }
    chassis_id { nil }
    unit_number { nil }
    association :created_by_user, factory: :user
  end
end

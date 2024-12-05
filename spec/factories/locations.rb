FactoryBot.define do
  factory :location do
    uuid { SecureRandom.uuid }
    name { Faker::Address.street_address }
    description { Faker::Lorem.sentence }
    address_line_1 { Faker::Address.street_address }
    address_line_2 { Faker::Address.secondary_address }
    address_line_3 { Faker::Address.community }
    city { Faker::Address.city }
    geographical_region { Faker::Address.state }
    country_iso_code { Faker::Address.country_code }
    timezone { Faker::Address.time_zone }
    culture { Faker::Address.locale }
    metadata { {} }
    association :created_by_user, factory: :user
    association :updated_by_user, factory: :user
    discarded_at { nil }
  end
end

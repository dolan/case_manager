FactoryBot.define do
  factory :location do
    uuid { "" }
    name { "MyString" }
    description { "MyString" }
    address_line_1 { "MyString" }
    address_line_2 { "MyString" }
    address_line_3 { "MyString" }
    city { "MyString" }
    geographical_region { "MyString" }
    country_iso_code { "MyString" }
    timezone { "MyString" }
    culture { "MyString" }
    metadata { "" }
    created_by_user_id { "" }
    updated_by_user_id { "MyString" }
    discarded_at { "2024-11-28 10:49:05" }
  end
end

FactoryBot.define do
  factory :api_key do
    key { "MyString" }
    user { nil }
    active { false }
    last_used_at { "2024-11-29 08:38:24" }
  end
end

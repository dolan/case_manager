FactoryBot.define do
  factory :case_activity do
    uuid { "" }
    case_id { "" }
    title { "MyString" }
    description { "MyString" }
    category { "MyString" }
    occurred_at { "2024-11-28 11:03:14" }
    actor_user_id { "" }
    target_user_id { "" }
    audience_category { "MyString" }
    metadata { "" }
    created_by_user_id { "" }
    updated_by_user_id { "" }
    discarded_at { "2024-11-28 11:03:14" }
  end
end

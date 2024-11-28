FactoryBot.define do
  factory :case do
    uuid { "" }
    reference_number { "MyString" }
    complaint { "MyString" }
    asset_id { "" }
    service_provider_business_location_id { "" }
    ship_to_customer_id { "" }
    bill_to_customer_id { "" }
    assigned_to_user_id { "" }
    source { "MyString" }
    created_by_user_id { "" }
    updated_by_user_id { "" }
    estimated_complete_at { "2024-11-28 10:55:39" }
    actual_completed_at { "2024-11-28 10:55:39" }
    next_follow_up_at { "2024-11-28 10:55:39" }
    checked_in_at { "2024-11-28 10:55:39" }
    discarded_at { "2024-11-28 10:55:39" }
    metadata { "" }
  end
end

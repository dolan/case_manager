FactoryBot.define do
  factory :case_total do
    uuid { "" }
    case_id { "" }
    total_price { "9.99" }
    tax_total { "9.99" }
    labor_total { "9.99" }
    materials_total { "9.99" }
    metadata { "" }
    created_by_user_id { "" }
    updated_by_user_id { "" }
    discarded_at { "2024-11-28 11:06:46" }
  end
end

FactoryBot.define do
  factory :case_item do
    uuid { "" }
    case_id { "" }
    item_order { 1 }
    title { "MyString" }
    description { "MyString" }
    metadata { "" }
    code { "MyString" }
    source { "MyString" }
    category { "MyString" }
    quantity { "9.99" }
    unit_of_measure { "MyString" }
    unit_price { "9.99" }
    created_by_user_id { "" }
    updated_by_user_id { "" }
    discarded_at { "2024-11-28 10:59:29" }
  end
end

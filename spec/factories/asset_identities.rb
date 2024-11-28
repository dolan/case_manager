FactoryBot.define do
  factory :asset_identity do
    uuid { "" }
    make { "MyString" }
    model { "MyString" }
    year { 1 }
    serial_number { "MyString" }
    vin { "MyString" }
    chassis_id { "MyString" }
    unit_number { "MyString" }
    created_by_user_id { "" }
  end
end

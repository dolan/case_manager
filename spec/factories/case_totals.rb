FactoryBot.define do
  factory :case_total do
    uuid { SecureRandom.uuid }
    association :case, factory: :case
    total_price { 100 }
    tax_total { 10 }
    labor_total { 90 }
    materials_total { 0 }
    metadata { {} }
    association :created_by_user, factory: :user
    association :updated_by_user, factory: :user
    discarded_at { nil }
  end
end

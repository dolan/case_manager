class Customer < ApplicationRecord
  include HasUuid

  belongs_to :business_location
  belongs_to :created_by_user, class_name: "User"
  belongs_to :updated_by_user, class_name: "User", optional: true
  has_many :billed_cases, class_name: "Case", foreign_key: "bill_to_customer_id"
  has_many :shipped_cases, class_name: "Case", foreign_key: "ship_to_customer_id"
end

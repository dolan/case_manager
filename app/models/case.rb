class Case < ApplicationRecord
  include HasUuid

  belongs_to :bill_to_customer, class_name: "Customer"
  belongs_to :ship_to_customer, class_name: "Customer"
  belongs_to :service_provider_business_location, class_name: "BusinessLocation"

  has_one :business, through: :service_provider_business_location
  alias_attribute :service_provider_business, :business

  belongs_to :assigned_to_user, class_name: "User"
  has_many :case_items
  has_one :case_total
  belongs_to :asset
  has_many :case_activities
end

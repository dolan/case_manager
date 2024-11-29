class BusinessLocation < ApplicationRecord
  include HasUuid

  belongs_to :location
  belongs_to :business
  has_many :assets
  has_many :service_provider_cases, class_name: "Case", foreign_key: "service_provider_business_location_id"
end

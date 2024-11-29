class Business < ApplicationRecord
  include HasUuid

  # TODO: Should this be optional?
  belongs_to :primary_location, class_name: "BusinessLocation", optional: true
  has_many :business_locations
  has_many :cases
end

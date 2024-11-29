class Location < ApplicationRecord
  include HasUuid

  has_many :business_locations
end

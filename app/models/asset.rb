class Asset < ApplicationRecord
  include HasUuid

  belongs_to :business_location
  belongs_to :asset_identity
  belongs_to :created_by_user, class_name: "User"
  belongs_to :updated_by_user, class_name: "User", optional: true
  has_many :cases
end

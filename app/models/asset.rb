class Asset < ApplicationRecord
  include HasUuid

  belongs_to :business_location
  belongs_to :asset_identity
  belongs_to :created_by_user, class_name: "User"
  belongs_to :updated_by_user, class_name: "User", optional: true
  has_many :cases

  scope :visible_to_user, ->(user, business_id = nil) do
    return all if user.has_global_permission?(Constants::Permissions[:assets][:read])

    joins(:business_location)
      .where(business_locations: {
        business_id: BusinessPolicy.new(user, business_id).visible_business_ids
      })
  end
end

class AssetIdentity < ApplicationRecord
  include HasUuid

  has_many :assets
  belongs_to :created_by_user, class_name: "User"
end

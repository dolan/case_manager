class UserGroupMembership < ApplicationRecord
  belongs_to :user
  belongs_to :group
  belongs_to :created_by_user, class_name: "User"
end

class UserRoleAssignment < ApplicationRecord
  belongs_to :user
  belongs_to :security_role
  belongs_to :created_by_user, class_name: "User"
end

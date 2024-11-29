class GroupRoleAssignment < ApplicationRecord
  include HasUuid

  belongs_to :group
  belongs_to :security_role
  belongs_to :created_by_user, class_name: "User"
end

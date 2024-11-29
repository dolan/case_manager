class SecurityRolePermission < ApplicationRecord
  include HasUuid

  belongs_to :security_role
  belongs_to :security_permission
  belongs_to :created_by_user, class_name: "User"
end

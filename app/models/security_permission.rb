class SecurityPermission < ApplicationRecord
  include HasUuid

  has_many :security_role_permissions
  has_many :security_roles, through: :security_role_permissions
end

class SecurityRole < ApplicationRecord
  include HasUuid

  has_many :group_role_assignments
  has_many :groups, through: :group_role_assignments

  has_many :user_role_assignments
  has_many :directly_assigned_users, through: :user_role_assignments, source: :user

  has_many :security_role_permissions
  # has_many :security_permissions, through: :security_role_permissions
  belongs_to :created_by_user, class_name: "User"
end

class Group < ApplicationRecord
  include HasUuid

  has_many :user_group_memberships
  has_many :users, through: :user_group_memberships
  has_many :group_role_assignments
  has_many :group_roles, through: :group_role_assignments
end

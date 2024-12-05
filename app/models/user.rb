class User < ApplicationRecord
  has_many :user_group_memberships
  # has_many :groups, through: :user_group_memberships
  has_many :user_role_assignments
  # has_many :user_roles, through: :user_role_assignments
  has_many :security_role_permissions, through: :user_roles

  has_many :assigned_cases, class_name: "Case", foreign_key: "assigned_to_user_id"
  has_many :case_activities_as_actor, class_name: "CaseActivity", foreign_key: "actor_user_id"
  has_many :case_activities_as_target, class_name: "CaseActivity", foreign_key: "target_user_id"

  def has_permission?(permission_key)
    permission_fetcher.has_permission?(permission_key)
  end

  def permissions
    permission_fetcher.all_permissions
  end

  def permission_keys
    permission_fetcher.permission_keys
  end

  private

  def permission_fetcher
    @permission_fetcher ||= UserPermissionFetcher.new(self)
  end
end

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

  def has_global_permission?(permission_key)
    permission_fetcher.has_global_permission?(permission_key)
  end

  def permissions
    permission_fetcher.all_permissions
  end

  def permission_keys
    permission_fetcher.permission_keys
  end

  def authorized_business_ids_for_permission(permission)
    # Direct role assignments
    direct_ids = UserRoleAssignment
      .joins(security_role: :security_role_permissions)
      .joins("INNER JOIN security_permissions ON security_permissions.id = security_role_permissions.security_permission_id")
      .where(user_id: id)
      .where(security_permissions: { name: permission })
      .pluck(:business_id)

    # Group role assignments
    group_ids = GroupRoleAssignment
      .joins(security_role: :security_role_permissions)
      .joins("INNER JOIN security_permissions ON security_permissions.id = security_role_permissions.security_permission_id")
      .joins("INNER JOIN user_group_memberships ON user_group_memberships.group_id = group_role_assignments.group_id")
      .where(user_group_memberships: { user_id: id })
      .where(security_permissions: { name: permission })
      .pluck(:business_id)

    (direct_ids + group_ids).uniq
  end

  private

  def permission_fetcher
    @permission_fetcher ||= UserPermissionFetcher.new(self, Current.account_id)
  end
end

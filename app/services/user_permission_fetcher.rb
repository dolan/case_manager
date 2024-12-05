class UserPermissionFetcher
  def initialize(user)
    @user = user
  end

  # Returns all permissions as an ActiveRecord::Relation
  def all_permissions
    SecurityPermission
      .joins(security_roles: :user_role_assignments)
      .where(user_role_assignments: { user_id: @user.id })
      .distinct
  end

  # Returns true/false if user has specific permission
  def has_permission?(permission_key)
    return false if permission_key.blank?

    # Cache the result for the duration of the request
    Rails.cache.fetch("user_#{@user.id}_permission_#{permission_key}", expires_in: 1.minute) do
      all_permissions.exists?(name: permission_key)
    end
  end

  # Returns array of permission keys
  def permission_keys
    all_permissions.pluck(:name)
  end

  private

  def role_ids
    @role_ids ||= @user.user_role_assignments.pluck(:security_role_id)
  end
end

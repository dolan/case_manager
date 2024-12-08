class UserPermissionFetcher
  attr_reader :user, :business_id

  def initialize(user, business_id = nil)
    @user = user
    @business_id = business_id || Current.account_id
  end

  # Returns all permissions as an ActiveRecord::Relation
  def all_permissions
    SecurityPermission
      .joins(security_roles: :user_role_assignments)
      .where(user_role_assignments: { user_id: user.id })
      .where(business_condition)
      .distinct
  end

  # Returns true/false if user has specific permission
  def has_permission?(permission_key)
    return false if permission_key.blank?

    cache_key = [ "user", user.id, "permission", permission_key ]
    cache_key << business_id if business_id

    Rails.cache.fetch(cache_key.join("_"), expires_in: 1.minute) do
      all_permissions.exists?(name: permission_key) || has_global_permission?(permission_key)
    end
  end

  # Returns true/false if user has specific permission globally
  def has_global_permission?(permission_key)
    return false if permission_key.blank?

    cache_key = [ "user", user.id, "global_permission", permission_key ]

    Rails.cache.fetch(cache_key.join("_"), expires_in: 1.minute) do
      SecurityPermission
        .joins(security_roles: :user_role_assignments)
        .where(
          user_role_assignments: {
            user_id: user.id,
            business_id: nil
          },
          name: permission_key
        )
        .exists?
    end
  end

  # Returns array of permission keys for the current context
  def permission_keys
    all_permissions.pluck(:name)
  end

  # Returns hash of permissions grouped by context
  def permissions_by_context
    {
      global: global_permission_keys,
      business: business_permission_keys
    }
  end

  private

  def global_permission_keys
    SecurityPermission
      .joins(security_roles: :user_role_assignments)
      .where(
        user_role_assignments: {
          user_id: user.id,
          business_id: nil
        }
      )
      .distinct
      .pluck(:name)
  end

  def business_permission_keys
    return [] unless business_id

    SecurityPermission
      .joins(security_roles: :user_role_assignments)
      .where(
        user_role_assignments: {
          user_id: user.id,
          business_id: business_id
        }
      )
      .distinct
      .pluck(:name)
  end

  def business_condition
    { user_role_assignments: { business_id: business_id } }
  end

  def role_ids
    @role_ids ||= user.user_role_assignments.pluck(:security_role_id)
  end
end

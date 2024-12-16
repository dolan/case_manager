module Api
  module Admin
    class SecurityRoleSerializer
      include Alba::Resource

      attributes :id, :name, :description, :created_at, :updated_at

      many :security_permissions
      many :directly_assigned_users, resource_name: :users
      many :groups
    end
  end
end

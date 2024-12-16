module Api
  module Admin
    class GroupSerializer
      include Alba::Resource

      attributes :id, :name, :description, :created_at, :updated_at

      many :users
      many :group_roles, resource_name: :security_roles
    end
  end
end

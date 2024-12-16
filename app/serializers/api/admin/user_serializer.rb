module Api
  module Admin
    class UserSerializer
      include Alba::Resource

      attributes :id, :email, :first_name, :last_name, :created_at, :updated_at

      many :groups
      many :user_roles, resource_name: :security_roles
    end
  end
end

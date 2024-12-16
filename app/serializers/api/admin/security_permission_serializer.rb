module Api
  module Admin
    class SecurityPermissionSerializer
      include Alba::Resource

      attributes :id, :name, :created_at, :updated_at
    end
  end
end

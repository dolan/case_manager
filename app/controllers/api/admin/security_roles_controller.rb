module Api
  module Admin
    class SecurityRolesController < ApplicationController
      def index
        roles = SecurityRole.all
        render jsonapi: roles
      end

      def show
        role = SecurityRole.find(params[:id])
        render jsonapi: role
      end

      def create
        role = SecurityRole.create!(role_params)
        render jsonapi: role, status: :created
      end

      def update
        role = SecurityRole.find(params[:id])
        role.update!(role_params)
        render jsonapi: role
      end

      def destroy
        role = SecurityRole.find(params[:id])
        role.destroy!
        head :no_content
      end

      private

      def required_permission
        case action_name
        when "index", "show"
          "security_roles.read"
        when "create"
          "security_roles.create"
        when "update"
          "security_roles.update"
        when "destroy"
          "security_roles.delete"
        end
      end

      def role_params
        params.require(:data).require(:attributes).permit(
          :name,
          :description,
          security_permission_ids: []
        )
      end
    end
  end
end

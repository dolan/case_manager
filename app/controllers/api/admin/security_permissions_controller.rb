module Api
  module Admin
    class SecurityPermissionsController < ApplicationController
      def index
        permissions = SecurityPermission.all
        render jsonapi: permissions
      end

      def show
        permission = SecurityPermission.find(params[:id])
        render jsonapi: permission
      end

      private

      def required_permission
        "security_permissions.read"
      end
    end
  end
end

require "#{Rails.root}/app/services/constants"

module Tasks
  module Permissions
    class EnsurePermissions
      include Rake::DSL

      def initialize
        namespace :permissions do
          desc "Ensure all required security permissions exist"
          task ensure: [ :environment ] do
            create_permissions
          end
        end
      end

      private

      def create_permissions
        Constants::PERMISSIONS.each do |resource, actions|
          actions.each do |_action, permission_name|
            SecurityPermission.find_or_create_by!(name: permission_name)
          end
        end

        admin_permissions = [
          "admin:users:list",
          "admin:users:read",
          "admin:users:create",
          "admin:users:update",
          "admin:users:delete",
          "admin:roles:list",
          "admin:roles:read",
          "admin:roles:create",
          "admin:roles:update",
          "admin:roles:delete",
          "admin:groups:list",
          "admin:groups:read",
          "admin:groups:create",
          "admin:groups:update",
          "admin:groups:delete",
          "admin:permissions:list",
          "admin:permissions:assign"
        ]

        admin_permissions.each do |permission|
          SecurityPermission.find_or_create_by!(name: permission)
        end

        puts "All permissions have been ensured"
      end
    end
  end
end

Tasks::Permissions::EnsurePermissions.new

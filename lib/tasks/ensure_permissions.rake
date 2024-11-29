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
        puts "All permissions have been ensured"
      end
    end
  end
end

Tasks::Permissions::EnsurePermissions.new

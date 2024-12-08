module Api
  module V1
    class ApplicationController < ActionController::API
      include Alba::Resource
      include ActivePolicy::Controller

      before_action :set_permission_context

      private

      def current_account_id
        Thread.current[:account_id]
      end

      def set_permission_context
        Current.account_id = current_account_id
      end
    end
  end
end

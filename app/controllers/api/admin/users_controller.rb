module Api
  module Admin
    class UsersController < ApplicationController
      def index
        users = User.all
        render jsonapi: users
      end

      def show
        user = User.find(params[:id])
        render jsonapi: user
      end

      def create
        user = User.create!(user_params)
        render jsonapi: user, status: :created
      end

      def update
        user = User.find(params[:id])
        user.update!(user_params)
        render jsonapi: user
      end

      def destroy
        user = User.find(params[:id])
        user.destroy!
        head :no_content
      end

      private

      def required_permission
        case action_name
        when "index", "show"
          "users.read"
        when "create"
          "users.create"
        when "update"
          "users.update"
        when "destroy"
          "users.delete"
        end
      end

      def user_params
        params.require(:data).require(:attributes).permit(
          :email,
          :first_name,
          :last_name
        )
      end
    end
  end
end

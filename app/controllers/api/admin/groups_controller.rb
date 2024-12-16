module Api
  module Admin
    class GroupsController < ApplicationController
      def index
        groups = Group.all
        render jsonapi: groups
      end

      def show
        group = Group.find(params[:id])
        render jsonapi: group
      end

      def create
        group = Group.create!(group_params)
        render jsonapi: group, status: :created
      end

      def update
        group = Group.find(params[:id])
        group.update!(group_params)
        render jsonapi: group
      end

      def destroy
        group = Group.find(params[:id])
        group.destroy!
        head :no_content
      end

      private

      def required_permission
        case action_name
        when "index", "show"
          "groups.read"
        when "create"
          "groups.create"
        when "update"
          "groups.update"
        when "destroy"
          "groups.delete"
        end
      end

      def group_params
        params.require(:data).require(:attributes).permit(
          :name,
          :description
        )
      end
    end
  end
end

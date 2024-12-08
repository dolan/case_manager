module Api
  module V1
    class BusinessesController < Api::BaseController
      def index
        authorize! Business, to: :index?
        businesses = policy_scope(Business)
        render json: ::V1::BusinessResource.new(businesses).serialize
      end

      def show
        business = authorize!(::Business.find_by!(uuid: params[:id]))
        render json: ::V1::BusinessResource.new(business).serialize
      end

      def create
        business = ::Business.new(business_params.merge(created_by_user_id: current_user.id))
        authorize! business, to: :create?

        if business.save
          render json: ::V1::BusinessResource.new(business).serialize, status: :created
        else
          render json: { errors: business.errors }, status: :unprocessable_entity
        end
      end

      def update
        business = ::Business.find_by!(uuid: params[:id])
        authorize! business, to: :update?

        if business.update(business_params)
          render json: ::V1::BusinessResource.new(business).serialize
        else
          render json: { errors: business.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        business = ::Business.find_by!(uuid: params[:id])
        authorize! business, to: :destroy?
        business.destroy

        head :no_content
      end

      private

      def business_params
        params.require(:business).permit(:name, :description, :category, :brand_identifier, :metadata)
      end
    end
  end
end

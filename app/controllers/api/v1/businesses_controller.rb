module Api
  module V1
    class BusinessesController < Api::BaseController
      def index
        businesses = authorize!(::Business.all)
        render json: ::V1::BusinessResource.new(businesses).serialize
      end

      def show
        business = authorize!(::Business.find_by!(uuid: params[:id]))
        render json: ::V1::BusinessResource.new(business).serialize
      end

      def create
        business = authorize!(::Business.new(business_params))

        if business.save
          render json: ::V1::BusinessResource.new(business).serialize, status: :created
        else
          render json: { errors: business.errors }, status: :unprocessable_entity
        end
      end

      def update
        business = authorize!(::Business.find_by!(uuid: params[:id]))

        if business.update(business_params)
          render json: ::V1::BusinessResource.new(business).serialize
        else
          render json: { errors: business.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        business = authorize!(::Business.find_by!(uuid: params[:id]))
        business.destroy

        head :no_content
      end

      private

      def business_params
        params.require(:business).permit(:name)
      end
    end
  end
end

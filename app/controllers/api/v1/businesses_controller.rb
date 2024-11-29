module Api
  module V1
    class BusinessesController < Api::BaseController
      before_action :set_business, only: [ :show, :update, :destroy ]

      def index
        @businesses = ::Business.all
        render json: ::V1::BusinessResource.new(@businesses)
      end

      def show
        render json: ::V1::BusinessResource.new(@business)
      end

      def create
        @business = ::Business.create!(business_params)
        render json: ::V1::BusinessResource.new(@business), status: :created
      end

      def update
        @business.update!(business_params)
        render json: ::V1::BusinessResource.new(@business)
      end

      def destroy
        @business.destroy
        head :no_content
      end

      private

      def business_params
        params.require(:business).permit(:name)
      end

      def set_business
        @business = ::Business.find_by(uuid: params[:id])
      end
    end
  end
end

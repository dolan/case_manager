module Api
  module Admin
    class ApplicationController < ActionController::API
      include Alba::ResourceController
      include AdminAuthorization

      rescue_from ActiveRecord::RecordNotFound do |e|
        render_error(404, "Not Found", e.message)
      end

      rescue_from ActiveRecord::RecordInvalid do |e|
        render_error(422, "Validation Error", e.message)
      end

      private

      def current_user
        @current_user ||= begin
          token = request.headers["Authorization"]&.split(" ")&.last
          User.find_by(api_token: token) if token
        end
      end

      def render_error(status, title, detail)
        render json: {
          errors: [ {
            status: status.to_s,
            title: title,
            detail: detail
          } ]
        }, status: status
      end
    end
  end
end

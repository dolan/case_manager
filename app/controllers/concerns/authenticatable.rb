# app/controllers/concerns/authenticatable.rb
module Authenticatable
  extend ActiveSupport::Concern

  included do
    before_action :set_current_user
  end

  private

  def set_current_user
    @current_user = User.find(request.env["current_user_id"])
  end

  def current_user
    @current_user
  end
end

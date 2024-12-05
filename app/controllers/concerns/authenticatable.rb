# app/controllers/concerns/authenticatable.rb
module Authenticatable
  extend ActiveSupport::Concern

  included do
    before_action :set_current_user
  end

  private

  def set_current_user
    @current_user = request.env["current_user"]
    Rails.logger.debug("Setting current user in Authenticatable: #{@current_user.inspect}")
    Rails.logger.debug("Current user class: #{@current_user.class}") if @current_user
  end

  def current_user
    Rails.logger.debug("Getting current user in Authenticatable: #{@current_user.inspect}")
    @current_user
  end
end

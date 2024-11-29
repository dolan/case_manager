# app/controllers/api/v1/base_controller.rb
module Api
  module V1
    class BaseController < ApplicationController
      include Authenticatable
      skip_before_action :verify_authenticity_token
    end
  end
end

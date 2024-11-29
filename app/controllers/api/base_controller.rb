module Api
  class BaseController < ApplicationController
    include Authenticatable
    skip_before_action :verify_authenticity_token
  end
end

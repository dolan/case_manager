module Api
  class BaseController < ApplicationController
    include Authenticatable
    skip_before_action :verify_authenticity_token

    include ActionPolicy::Controller
    authorize :user, through: :current_user

    # Only needed if not using current_user
    # authorize :user, through: :current_user
  end
end

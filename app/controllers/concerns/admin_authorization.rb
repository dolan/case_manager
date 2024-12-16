module AdminAuthorization
  extend ActiveSupport::Concern

  included do
    before_action :authorize_admin_access!
  end

  private

  def authorize_admin_access!
    unless current_user&.has_global_permission?(required_permission)
      render_error(403, "Forbidden", "You don't have permission to perform this action")
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

  def required_permission
    "#{controller_name}.#{action_name}"
  end
end

# app/middleware/api_authentication.rb
class ApiAuthentication
  def initialize(app)
    @app = app
  end

  def call(env)
    request = ActionDispatch::Request.new(env)
    auth_header = request.headers["Authorization"]

    Rails.logger.debug("API Authentication: #{auth_header}")

    if auth_header&.start_with?("Bearer ")
      token = auth_header.split(" ").last
      if user = authenticate_request(token)
        Rails.logger.debug("Setting user in middleware: #{user.inspect}")
        Rails.logger.debug("User class: #{user.class}")
        env["current_user"] = user
        @app.call(env)
      else
        [ 401, { "Content-Type" => "application/json" }, [ { error: "Unauthorized" }.to_json ] ]
      end
    else
      [ 401, { "Content-Type" => "application/json" }, [ { error: "Authorization header required" }.to_json ] ]
    end
  end

  private

  def authenticate_request(token)
    Rails.logger.debug("Authenticating request with token: #{token}")
    api_key = ApiKey.find_by(key: token)
    Rails.logger.debug("API key: #{api_key.inspect}")
    api_key&.user
  end
end

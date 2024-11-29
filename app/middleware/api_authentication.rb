# app/middleware/api_authentication.rb
class ApiAuthentication
  def initialize(app)
    @app = app
  end

  def call(env)
    request = ActionDispatch::Request.new(env)
    auth_header = request.headers["Authorization"]

    if auth_header&.start_with?("Bearer ")
      token = auth_header.split(" ").last
      if user = authenticate_request(token)
        env["current_user_id"] = user.id
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
    api_key = ApiKey.find_by(key: token)
    api_key&.user
  end
end

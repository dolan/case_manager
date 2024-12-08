class AccountContextMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    request = ActionDispatch::Request.new(env)
    account_uuid = request.headers["X-Account-UUID"]

    if account_uuid.blank? && !skip_account_check?(request.path)
      return [
        401,
        { "Content-Type" => "application/vnd.api+json" },
        [ { errors: [ { status: "401", title: "Account context required",
           detail: "X-Account-UUID header is required for this request" } ] }.to_json ]
      ]
    end

    if account_uuid.present?
      business = Business.find_by(uuid: account_uuid)
      Thread.current[:account_id] = business&.id
    end

    @app.call(env)
  ensure
    Thread.current[:account_id] = nil
  end

  private

  def skip_account_check?(path)
    [ "/health_check", "/api/v1/login" ].include?(path)
  end
end

class AccountContextMiddleware
  def initialize(app, exclude_paths: [])
    @app = app
    @exclude_paths = exclude_paths + [
      "/health_check",
      "/api/v1/login",
      %r{^/api/admin/}
    ]
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
    @exclude_paths.any? do |pattern|
      case pattern
      when String
        pattern == path
      when Regexp
        pattern.match?(path)
      end
    end
  end
end

# Raised when authentication fails or no user is present
# Used primarily in authentication middleware and controllers
class UnauthorizedError < StandardError
  def initialize(message = "Authentication required")
    super
  end
end

# Raised when a user lacks permissions for the requested action
# Used primarily in authorization checks and policy enforcement
class ForbiddenError < StandardError
  def initialize(message = "You don't have permission to perform this action")
    super
  end
end

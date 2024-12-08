class UserRoleAssignment < ApplicationRecord
  belongs_to :user
  belongs_to :security_role
  belongs_to :business, optional: true
  belongs_to :created_by_user, class_name: "User"

  # Scope for finding role assignments in a business context
  scope :for_business, ->(business_id) { where(business_id: [ business_id, nil ]) }
end

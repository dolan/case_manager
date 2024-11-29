class CaseItem < ApplicationRecord
  include HasUuid

  belongs_to :case
  belongs_to :created_by_user, class_name: "User"
  belongs_to :updated_by_user, class_name: "User", optional: true
end

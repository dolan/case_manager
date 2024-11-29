module V1
  class CaseResource
    include Alba::Resource

    root_key :case

    attributes :uuid, :status, :created_at, :updated_at

    many :case_items
    one :business, resource: "V1::BusinessResource"
    one :bill_to_customer, resource: "V1::CustomerResource"
    one :ship_to_customer, resource: "V1::CustomerResource"
    one :assigned_user, resource: "V1::UserResource"
  end
end

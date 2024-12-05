module V1
  class CaseResource
    include Alba::Resource

    root_key :case

    attributes :uuid, :status, :created_at, :updated_at

    many :case_items, resource: "V1::CaseItemResource", id_attribute: :uuid
    one :business, resource: "V1::BusinessResource", id_attribute: :uuid
    one :bill_to_customer, resource: "V1::CustomerResource", id_attribute: :uuid
    one :ship_to_customer, resource: "V1::CustomerResource", id_attribute: :uuid
    one :assigned_user, resource: "V1::UserResource"
  end
end

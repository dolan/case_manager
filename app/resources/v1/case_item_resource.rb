module V1
  class CaseItemResource
    include Alba::Resource

    root_key :case_item

    attributes :uuid, :created_at, :updated_at

    one :case, resource: "V1::CaseResource", id_attribute: :uuid
  end
end

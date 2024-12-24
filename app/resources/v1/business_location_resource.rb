module V1
  class BusinessLocationResource
    include Alba::Resource

    root_key :business_location

    attributes :uuid, :name, :created_at, :updated_at

    # one :business, resource: "V1::BusinessResource", id_attribute: :uuid
    # many :assets, resource: "V1::AssetResource", id_attribute: :uuid
  end
end

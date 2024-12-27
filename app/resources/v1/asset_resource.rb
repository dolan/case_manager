module V1
  class AssetResource
    include Alba::Resource

    root_key :asset

    attributes :uuid, :created_at, :updated_at

    one :asset_identity do |asset, params|
      attributes :uuid, :make, :model, :serial_number, :created_at, :updated_at
    end
    # one :business_location, resource: "V1::BusinessLocationResource", id_attribute: :uuid
  end
end

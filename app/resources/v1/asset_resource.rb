module V1
  class AssetResource
    include Alba::Resource

    root_key :asset

    attributes :uuid, :created_at, :updated_at

    one :asset_identity, resource: "V1::AssetIdentityResource"
    one :business_location, resource: "V1::BusinessLocationResource"
  end
end

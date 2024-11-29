module V1
  class AssetIdentityResource
    include Alba::Resource

    root_key :asset_identity

    attributes :uuid, :name, :description, :created_at, :updated_at

    many :assets, resource: "V1::AssetResource"
  end
end

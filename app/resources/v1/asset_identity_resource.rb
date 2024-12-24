module V1
  class AssetIdentityResource
    include Alba::Resource

    root_key :asset_identity

    attributes :uuid, :make, :model, :serial_number, :created_at, :updated_at

    many :assets, resource: "V1::AssetResource", id_attribute: :uuid
  end
end

module V1
  class BusinessLocationResource
    include Alba::Resource

    root_key :business_location

    attributes :uuid, :name, :address, :created_at, :updated_at

    one :business, resource: "V1::BusinessResource"
    many :assets, resource: "V1::AssetResource"
  end
end

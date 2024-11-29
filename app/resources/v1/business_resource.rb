module V1
  class BusinessResource
    include Alba::Resource

    root_key :business

    attributes :uuid, :name, :created_at, :updated_at

    many :business_locations, resource: "V1::BusinessLocationResource"
    many :cases, resource: "V1::CaseResource"
    many :assets, resource: "V1::AssetResource"
  end
end

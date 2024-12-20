module V1
  class BusinessResource
    include Alba::Resource

    root_key :business

    attributes :uuid, :name, :description, :category, :brand_identifier, :metadata, :created_at, :updated_at

    many :business_locations, resource: "V1::BusinessLocationResource", id_attribute: :uuid
  end
end

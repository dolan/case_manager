module V1
  class CustomerResource
    include Alba::Resource

    root_key :customer

    attributes :uuid, :name, :email, :created_at, :updated_at

    # many :cases, id_method: :uuid
  end
end

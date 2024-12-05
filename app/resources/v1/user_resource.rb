module V1
  class UserResource
    include Alba::Resource

    root_key :user

    attributes :uuid, :email, :first_name, :last_name, :created_at, :updated_at

    many :assigned_cases, id_method: :uuid, resource: "V1::CaseResource"
  end
end

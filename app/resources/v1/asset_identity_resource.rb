module V1
  class AssetIdentityResource
    include Alba::Resource

    root_key :asset_identity

    attributes :uuid, :created_at, :updated_at

    many :assets do |asset_identity, params|
      next if params.nil? # if we returned nil in a child loop, we need to bust out here too

      params[:visited] ||= {}
      params[:visited][:asset_identities] ||= Set.new

      return nil if params[:visited][:asset_identities].include?(asset_identity.id)

      params[:visited][:asset_identities].add(asset_identity.id)
      asset_identity.assets
    end
  end
end

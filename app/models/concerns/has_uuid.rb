module HasUuid
  extend ActiveSupport::Concern

  included do
    before_validation :set_uuid, on: :create
  end

  def set_uuid
    self.uuid = SecureRandom.uuid
  end
end

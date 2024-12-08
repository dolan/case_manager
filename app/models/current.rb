class Current < ActiveSupport::CurrentAttributes
  attribute :account_id

  def account
    Business.find_by(id: account_id) if account_id.present?
  end
end

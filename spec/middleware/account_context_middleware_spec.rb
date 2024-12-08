require 'rails_helper'

RSpec.describe AccountContextMiddleware do
  let(:app) { ->(env) { [ 200, env, "app" ] } }
  let(:middleware) { described_class.new(app) }
  let(:account_uuid) { SecureRandom.uuid }
  let(:business) { create(:business, uuid: account_uuid) }

  context 'when X-Account-UUID header is present' do
    let(:env) { { 'HTTP_X_ACCOUNT_UUID' => account_uuid } }

    before do
      business # ensure business exists
    end

    it 'sets the account_id in the thread' do
      middleware.call(env)
      expect(Thread.current[:account_id]).to be_nil # Should be cleared after request
    end

    it 'sets the correct business id' do
      expect {
        middleware.call(env)
      }.to change { Thread.current[:account_id] }.from(nil).to(business.id)
    end

    it 'allows the request to proceed' do
      status, = middleware.call(env)
      expect(status).to eq(200)
    end
  end

  context 'when X-Account-UUID header is missing' do
    let(:env) { { 'PATH_INFO' => '/api/v1/resources' } }

    it 'returns 401 unauthorized' do
      status, = middleware.call(env)
      expect(status).to eq(401)
    end
  end

  context 'when path is in skip list' do
    let(:env) { { 'PATH_INFO' => '/health_check' } }

    it 'allows the request without account uuid' do
      status, = middleware.call(env)
      expect(status).to eq(200)
    end
  end
end

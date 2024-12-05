require 'rails_helper'

RSpec.describe UserPermissionFetcher do
  let(:new_user) { create(:user) }
  let!(:role) { create(:security_role, created_by_user: new_user, updated_by_user: new_user) }
  let(:permission) {
    create(:security_permission,
      name: 'businesses.list',
      created_by_user: new_user
    )
  }
  let(:fetcher) { described_class.new(new_user) }

  before do
    create(:user_role_assignment, user: new_user, security_role: role)
    create(:security_role_permission,
      security_role: role,
      security_permission: permission,
      created_by_user: new_user
    )
  end

  describe '#all_permissions' do
    it 'returns all permissions for the user' do
      expect(fetcher.all_permissions).to include(permission)
    end
  end

  describe '#has_permission?' do
    it 'returns true when user has the permission' do
      expect(fetcher.has_permission?('businesses.list')).to be true
    end

    it 'returns false when user does not have the permission' do
      expect(fetcher.has_permission?('nonexistent.permission')).to be false
    end

    it 'returns false when permission key is blank' do
      expect(fetcher.has_permission?(nil)).to be false
      expect(fetcher.has_permission?('')).to be false
    end
  end

  describe '#permission_keys' do
    it 'returns array of permission keys' do
      expect(fetcher.permission_keys).to include('businesses.list')
    end
  end
end

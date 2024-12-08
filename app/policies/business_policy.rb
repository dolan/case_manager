class BusinessPolicy < ApplicationPolicy
  def index?
    user.has_permission?(Constants::PERMISSIONS[:businesses][:list])
  end

  def show?
    user.has_permission?(Constants::PERMISSIONS[:businesses][:view])
  end

  def create?
    user.has_permission?(Constants::PERMISSIONS[:businesses][:create])
  end

  def update?
    user.has_permission?(Constants::PERMISSIONS[:businesses][:update])
  end

  def destroy?
    user.has_permission?(Constants::PERMISSIONS[:businesses][:delete])
  end

  # the scope is used to filter collections
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.has_global_permission?(Constants::PERMISSIONS[:businesses][:list])
        scope.all
      else
        scope.none
      end
    end

    def visible_business_ids
      user.has_global_permission?(Constants::Permissions[:assets][:read]) ? scope.pluck(:id) : []
    end
  end
end

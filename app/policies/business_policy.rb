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

   class Scope
     def resolve
       if user.has_permission?(Constants::PERMISSIONS[:businesses][:list])
         scope.all
       else
         scope.none
       end
     end
   end
end

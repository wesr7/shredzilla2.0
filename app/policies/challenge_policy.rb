class ChallengePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.last
      end
    end
  end

  def create?
    user.admin?
  end

  def new?
    user.admin?
  end

  def save?
    user.admin?
  end

  def destroy?
    user.admin?
  end
end

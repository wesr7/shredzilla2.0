class ChallengePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(:id => 2)
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
end

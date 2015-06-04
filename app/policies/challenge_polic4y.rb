class ChallengePolicy < ApplicationPolicy
  def index?
    true
  end

  def new?
  end

  def create?

  end

  class Scope < Scope
    def resolve
    end
  end

  def update?
    user.admin? or not post.published?
  end
end

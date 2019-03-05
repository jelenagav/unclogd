class ItemPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?

  end

  def edit?

  end

  def update?

  end

  def show?
    return true
  end

  def destroy?

  end
end

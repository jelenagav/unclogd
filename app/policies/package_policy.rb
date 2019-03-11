class PackagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return true
  end

  def edit?

  end

  def update?

  end

  def show?
    return true
  end

  def show_multiple?
    return true
  end

  def destroy?

  end
end

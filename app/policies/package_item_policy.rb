class PackageItemPolicy < ApplicationPolicy
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

  def destroy?
    return true
  end
end

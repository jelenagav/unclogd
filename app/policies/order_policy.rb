class OrderPolicy < ApplicationPolicy
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
    record.package.user == user
  end

  def destroy?
    return true
  end

  def returns
    return true
  end
end

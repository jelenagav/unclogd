class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return true
  end

  def edit?
    user == record
  end

  def update?
    user == record
  end

  def show?
    return true
  end

  def destroy?
    user == record
  end

  def overview?
    return true
  end
end

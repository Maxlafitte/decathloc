class EquipmentPolicy < ApplicationPolicy
  def create?
    return true
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end

class Scope < Scope
  def resolve
    scope.all
  end
end

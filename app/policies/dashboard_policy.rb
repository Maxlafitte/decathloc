class DashboardPolicy < ApplicationPolicy

  def my_equipments?
    return true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end

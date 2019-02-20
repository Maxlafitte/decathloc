class DashboardPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      scope.select {|record| record.user == user}
    end
  end
end

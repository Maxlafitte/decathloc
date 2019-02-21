class DashboardsController < ApplicationController
  skip_after_action :verify_authorized
  after_action :verify_policy_scoped

  def my_equipments
    authorize :dashboard, :my_equipments?
    @equipments = policy_scope(Equipment).where(user: current_user)
  end
end

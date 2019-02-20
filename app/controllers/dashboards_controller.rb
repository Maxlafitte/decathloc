class DashboardsController < ApplicationController
  skip_after_action :verify_authorized
  after_action :verify_policy_scoped

  def show
    authorize :dashboard, :show?
    @equipments = policy_scope(Equipment).where(user: current_user)
  end
end

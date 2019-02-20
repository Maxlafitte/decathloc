class DashboardsController < ApplicationController
  skip_after_action :verify_authorized
  after_action :verify_policy_scoped

  def show
    @equipments = policy_scope(Equipment)
  end
end

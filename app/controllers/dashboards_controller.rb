class DashboardsController < ApplicationController
  skip_after_action :verify_authorized
  after_action :verify_policy_scoped

  def my_equipments
    authorize :dashboard, :my_equipments?
    @equipments = policy_scope(Equipment).where(user: current_user)
  end

  def my_bookings
    authorize :dashboard, :my_bookings?
    @bookings_sent = policy_scope(Booking).where(user: current_user)
    @bookings_received = Booking.all.select do |booking|
      booking.equipment.user == current_user
    end
  end
end

class BookingsController < ApplicationController
  def index
  end

  def create
    @equipment = Equipment.find(params[:equipment_id])
    authorize @equipment
    @booking = Booking.new(review_params)
    authorize @booking
    @booking.equipment = @equipment
    @booking.status = "pending"
    @booking.user = current_user
    if @booking.save
      redirect_to dashboard_bookings_path
    else
      render 'equipments/show'
    end
  end

  private

  def review_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end

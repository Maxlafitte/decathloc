class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def create
    @equipment = Equipment.find(params[:equipment_id])
    authorize @equipment
    @booking = Booking.new(review_params)
    authorize @booking
    @booking.equipment = @equipment
    @booking.user = current_user
    if @booking.save
      redirect_to equipment_path(@equipment)
    else
      render 'equipments/show'
    end
  end

  private

  def review_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end

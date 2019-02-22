class BookingsController < ApplicationController
  def index
  end

  def create
    @equipment = Equipment.find(params[:equipment_id])
    authorize @equipment

    @booking = Booking.new(review_params)
    authorize @booking
    @booking.equipment = @equipment
    @booking.price = @equipment.daily_price * (@booking.end_date.to_date - @booking.start_date.to_date).to_i
    @booking.status = "Pending"
    @booking.user = current_user
    if @booking.save
      redirect_to dashboard_bookings_path
    else
      render 'equipments/show'
    end
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    if params[:commit] == "Accept"
      if @booking.update(status: "Accepted")
        redirect_to dashboard_bookings_path
      else
        render :my_bookings
      end
    end
    if params[:commit] == "Decline"
      if @booking.update(status: "Declined")
        redirect_to dashboard_bookings_path
      else
        render :my_bookings
      end
    end
    if params[:commit] == "Cancel"
      if @booking.update(status: "Cancelled")
        redirect_to dashboard_bookings_path
      else
        render :my_bookings
      end
    end
  end

  private

  def review_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end

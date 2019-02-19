class BookingsController < ApplicationController
  def create
    @equipment = Equipment.find(params[:equipment_id])
    @equipment = Booking.new(review_params)
    @booking.equipment = @equipment
    if @booking.save
      redirect_to equipement_path(@equipment)
    else
      render 'equipments/show'
    end
  end

  private

  def review_params
    params.require(:booking).permit(:content, :first_day, :last_day)
  end
end

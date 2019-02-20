class EquipmentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_equipments, only: [:index, :new, :create, :show]

  def index
  end

  def show
    @equipment = Equipment.find(params[:id])
    @booking = Booking.new
    authorize @equipment
  end

  def new
    @equipment = Equipment.new
    authorize @equipment
  end

  def create
    @equipment = Equipment.new(equipment_params)
    @equipment.user = current_user
    authorize @equipment
    if @equipment.save
      redirect_to dashboard_path(@equipments)
    else
      render :new
    end
  end

  private

  def set_equipments
    @equipments = policy_scope(Equipment)
  end

  def equipment_params
    params.require(:equipment).permit(:title, :description, :size, :shape, :daily_price, :photo, :location)
  end
end

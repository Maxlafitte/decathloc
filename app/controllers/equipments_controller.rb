class EquipmentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @equipments = policy_scope(Equipment)
  end

  def show
    @equipment = Equipment.find(params[:id])
    # authorize @equipment
  end

  def new
    @equipment = Equipment.new
    authorize @equipment
  end

  def create
    @equipment = Equipment.create(equipment_params)
    authorize @equipment
    if @equipment.save
      redirect_to equipments_path(@equipment)
    else
      render :new
    end
  end

  private

  def equipment_params
    params.require(:equipment).permit(:title, :description, :size, :shape, :daily_price, :photo, :location)
  end
end

class EquipmentsController < ApplicationController

  def create
    authorize @equipment
  end

  def index
    @equipments = policy_scope(Equipment)
  end

  def show
    @equipment = Equipment.find(params[:id])
    # authorize @equipment
  end
end

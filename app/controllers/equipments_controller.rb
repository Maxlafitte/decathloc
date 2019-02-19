class EquipmentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]


  def index
    @equipments = policy_scope(Equipment)
    authorize @equipments
  end

  def show
    @equipment = Equipment.find(params[:id])
    # authorize @equipment
  end

  def create
    authorize @equipment
  end
end

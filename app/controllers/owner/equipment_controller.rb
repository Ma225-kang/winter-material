class Owner::EquipmentController < ApplicationController
  def new
    @equipment = Equipment.new
  end

  def create
    @equipment = Equipment.new(equipment_params)
    @equipment.owner = current_user

    if @equipment.save
      redirect_to equipment_path(@equipment)
    else
      render :new
    end
  end

  private

  def equipment_params
    params.require(:equipment).permit(:name, :description, :photo, :address, :price_per_day)
  end
end

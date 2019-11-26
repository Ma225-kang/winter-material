class EquipmentController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  def index
    @user = User.new
    @equipment = Equipment.all
  end

  def show
    @equipment = Equipment.find(params[:id])
  end
end

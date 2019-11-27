class EquipmentController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  def index
    @user = User.new
    @equipment = Equipment.geocoded

    @markers = @equipment.map do |equip|
      {
        lat: equip.latitude,
        lng: equip.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { equipment: equip })
      }
    end
  end

  def show
    @equipment = Equipment.find(params[:id])
  end
end

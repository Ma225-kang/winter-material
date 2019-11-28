class EquipmentController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  def index
    @user = User.new
    @equipment = Equipment.geocoded

    @markers = @equipment.map do |equip|
      {
        lat: equip.latitude,
        lng: equip.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { equipment: equip }),
        image_url: helpers.asset_url('pointer-ski.png')
      }
    end
  end

  def show
    @equipment = Equipment.find(params[:id])
    @reservation = Reservation.new
  end
end

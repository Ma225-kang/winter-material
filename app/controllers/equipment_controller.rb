class EquipmentController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  def index
    @user = User.new

    if params[:query].present?
      @equipments = Equipment.search_name_and_description(params[:query]).geocoded
    else
      @equipments = Equipment.geocoded
    end

    @markers = @equipments.map do |equip|
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

    @markers = [
      {
        lat: @equipment.latitude,
        lng: @equipment.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { equipment: @equipment }),
        image_url: helpers.asset_url('pointer-ski.png')
      }]
  end
end

class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def new
    @equipment = Equipment.find(params[:equipment_id])
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.save
  end

  private

  def reservation_params
    params.require(:reservation).permit(:name)
  end
end

class Owner::ReservationsController < ApplicationController

  def index
    @reservations = current_user.owner_reservations
  end

  def accept
    @reservation = Reservation.find(params[:id])
    @reservation.status = "accepted"
    @reservation.save
    redirect_to owner_reservations_path(current_user)
  end

  def decline
    @reservations = Reservation.find(params[:id])
    @reservation.status = "declined"
    @reservation.save
    redirect_to owner_reservations_path(current_user)
  end
end

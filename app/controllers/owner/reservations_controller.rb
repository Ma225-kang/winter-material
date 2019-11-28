class Owner::ReservationsController < ApplicationController

  def index
    @reservations = current_user.reservations
  end

  def accept
    @reservations = current_user.reservations
    @reservation.status = "accepted"
  end

  def decline
    @reservations = current_user.reservations
    @reservation.status = "declined"
  end
end

class Owner::ReservationsController < ApplicationController

  def index
    @reservations = current_user.reservations
  end

  def accept
    @reservations = current_user.reservations
    @reservations.update(reservation_params(:status))
    @reservations.status = "accepted"
    redirect_to owner_reservations_path(current_user)
  end

  def decline
    @reservations = current_user.reservations
    @reservation.status = "declined"
  end

  private

  def reservation_params
    reservation_params = params.require(:reservation).permit(:status)
  end
end

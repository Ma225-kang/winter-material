class ReservationsController < ApplicationController



  def index
    @reservations = current_user.reservations

  end

  def new
    @equipment = Equipment.find(params[:equipment_id])
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @equipment = Equipment.find(params[:equipment_id])
    @reservation.equipment = @equipment
    @reservation.user = current_user
    @reservation.total_price = @equipment.price_per_day * (@reservation.end_date - @reservation.start_date).to_i

    if @reservation.save
      redirect_to reservations_path
    else
      render :new
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end
end

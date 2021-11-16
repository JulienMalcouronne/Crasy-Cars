class ReservationsController < ApplicationController

   before_action :set_reservation, only: %i[destroy]
  def new
    @reservation = Reservation.new
    @car = Car.find(params[:car_id])
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @car = Car.find(params[:car_id])
    @reservation.car = @car
    @reservation.user = current_user
    if @reservation.save!
      redirect_to car_path(@car), notice: 'Reservation was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @car.destroy
    redirect_to cars_path
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:comment, :car_id, :started_date, :end_date, :price, :total)
  end

end

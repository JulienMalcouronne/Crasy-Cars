class ReservationsController < ApplicationController

   before_action :set_reservation, only: %i[destroy show]
  def new
    @reservation = Reservation.new
    authorize @reservation
    @car = Car.find(params[:car_id])
  end

  def create
    @reservation = Reservation.new(reservation_params)
    authorize @reservation
    @car = Car.find(params[:car_id])
    @reservation.car = @car
    @reservation.user = current_user
    if @reservation.save!
      redirect_to car_reservation_path(@car, @reservation), notice: 'Reservation was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @reservation.destroy
    redirect_to cars_path
  end

  def show
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
    authorize @reservation
  end

  def reservation_params
    params.require(:reservation).permit(:comment, :car_id, :started_date, :end_date, :price, :total)
  end

end

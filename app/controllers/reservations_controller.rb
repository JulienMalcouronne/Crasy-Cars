class ReservationsController < ApplicationController

   before_action :set_reservation, only: %i[destroy show confirm refuse]
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
      redirect_to car_reservation_path(@car, @reservation)
      flash[:alert] = 'Booking was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @reservation.destroy
    redirect_to cars_path
  end

  def show
    @car = @reservation.car
    @markers = [
      {
        lat: @car.latitude,
        lng: @car.longitude,
        info_window: render_to_string(partial: "info_window", locals: { car: @car }),
        image_url: helpers.asset_url("rocket.png")
      }]
  end

  def confirm
    @reservation.update(status: "accepted")
    redirect_to "/dashboard"
  end

  def refuse
    @reservation.update(status: "canceled")
    redirect_to "/dashboard"
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

class CarsController < ApplicationController
  before_action :set_car, only: %i[show]

  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.users_id = current_user.id
    if @car.save
      redirect_to @car, notice: 'car was successfully created.'
    else
      render :new
    end
  end

  def show

  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:name, :category, :address, :price, :capacity, :features, :summary, :engine, :photo)
  end

end

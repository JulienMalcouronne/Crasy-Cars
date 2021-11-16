class CarsController < ApplicationController
  before_action :set_car, only: %i[show edit update destroy]

  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    if @car.save!
      redirect_to @car, notice: 'car was successfully created.'
    else
      render :new
    end
  end

  def show

  end

  def destroy
    @car.destroy
    redirect_to cars_path
  end

  def edit
  end

  def update
    @car.update(car_params)
    redirect_to cars_path
  end

  def search
    @cars = Car.where("name LIKE '%#{params[:query]}%'")
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:name, :category, :address, :price, :capacity, :features, :summary, :engine, :photo)
  end

end

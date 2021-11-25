class CarsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_car, only: %i[show destroy]

  def index
    @cars = Car.all
  end

  def show
    @booking = Booking.new
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    if @car.save
      redirect_to mine_cars_path
    else
      render :new
    end
  end

  def mine
    @cars = current_user.cars
  end

  private

  def car_params
    params.require(:car).permit(:brand, :model, :capacity, :price, :picture_url)
  end

  def set_car
    @car = Car.find(params[:id])
  end
end

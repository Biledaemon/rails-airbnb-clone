class CarsController < ApplicationController

  before_action :set_car, only: %i[show new create destroy]

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
    if @car.save
      redirect_to car_path(@car)
    else
      render :new
    end
  end

  private

  def car_params
    params.require(:car).permit(:car, :user)
  end

  def set_car
    @car = Car.find(params[:id])
  end
end

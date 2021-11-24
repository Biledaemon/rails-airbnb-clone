class CarsController < ApplicationController

  before_action :set_car, only: %i[new create destroy]

  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
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

  # def destroy
  #   @cars = Car.find(params[:id])
  #   @cars.destroy
  #   redirect_to root_path
  # end

  private

  def car_params
    params.require(:car).permit(:car, :user)
  end

  def set_car
    @car = Car.find(params[:id])
  end
end

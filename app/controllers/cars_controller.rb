class CarsController < ApplicationController

  before_action :set_car, only: %i[new create destroy]

  def new
    @cars = Cars.new
  end

  def create
    @cars = Car.new(booking_params)
    @cars.car = @car
    @cars.save
    redirect_to car_path(@car)
  end

  # def destroy
  #   @cars = Car.find(params[:id])
  #   @cars.destroy
  #   redirect_to root_path
  # end

  private

  def car_params
    params.require(:cars).permit(:car, :user)
  end

  def set_car
    @car = Car.find(params[:car_id])
  end
end

class BookingsController < ApplicationController
  before_action :set_car, only: [:new, :create, :destroy]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.car = @car
    @booking.save
    redirect_to car_path(@car)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to root_path
  end

  private

  def booking_params
    params.require(:booking).permit(:car, :user)
  end

  def set_car
    @car = Car.find(params[:car_id])
  end
end

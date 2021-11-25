class BookingsController < ApplicationController
  before_action :set_car, only: [:new, :create, :destroy]

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new
    @booking.car = @car
    @booking.user = current_user
    @booking.save
    redirect_to confirm_booking_path(@booking)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to root_path
  end

  def confirm
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:car, :user)
  end

  def set_car
    @car = Car.find(params[:car_id])
  end
end

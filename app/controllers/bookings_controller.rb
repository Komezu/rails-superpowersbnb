class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new
    if @booking.save
      redirect_to_booking_path(@booking)
    else
      render :new, status: 422
    end
  end

  def index
    @bookings = Booking.all
  end

  def my_bookings
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end
end

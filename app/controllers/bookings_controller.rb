class BookingsController < ApplicationController
  def my_bookings
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end
end

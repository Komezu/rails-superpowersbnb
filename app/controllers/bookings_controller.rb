class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @superpower = Superpower.find(params[:superpower_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @superpower = Superpower.find(params[:superpower_id])
    # @booking.user = current_user
    # @booking.superpower = @superpower
    if @booking.save
      redirect_to_booking_path(@booking)
    else
      render :new, status: 422
    end
  end

  def my_bookings
    @bookings_as_rentee = Booking.where(user: current_user)
    @bookings_as_rentor = Booking.where(superpower: current_user.superpowers)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end

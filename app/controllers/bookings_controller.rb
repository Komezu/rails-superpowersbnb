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
      raise
      render :new, status: 422
    end
  end

  def index
    @bookings = Booking.all
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end

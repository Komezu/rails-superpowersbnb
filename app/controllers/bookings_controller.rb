class BookingsController < ApplicationController
  before_action :set_superpower, only: %i[new create]
  before_action :set_booking, only: %i[show accept decline cancel]

  def show
    @user_is_power_owner = @booking.user != current_user
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.superpower = @superpower
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new, status: 422
    end
  end

  def my_bookings
    @bookings = Booking.where(user: current_user)
  end

  def my_owner_bookings
    @bookings = Booking.where(superpower: current_user.superpowers)
  end

  def accept
    @booking.status = "accepted"
    @booking.save
    redirect_to booking_path(@booking)
  end

  def decline
    @booking.status = "declined"
    @booking.save
    redirect_to booking_path(@booking)
  end

  def cancel
    @booking.status = "cancelled"
    @booking.save
    redirect_to booking_path(@booking)
  end

  private

  def set_superpower
    @superpower = Superpower.find(params[:superpower_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end

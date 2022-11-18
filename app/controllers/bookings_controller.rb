class BookingsController < ApplicationController
  before_action :set_superpower, only: %i[new create]
  before_action :set_booking, only: %i[show accept decline cancel]

  def show
    @user_is_power_owner = @booking.user != current_user
    @total_price = ((@booking.end_date - @booking.start_date).to_i + 1) * @booking.superpower.price_per_day
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
    @bookings = Booking.where(user: current_user).order(created_at: :desc)
  end

  def my_owner_bookings
    @bookings = Booking.where(superpower: current_user.superpowers).order(created_at: :desc)
  end

  def accept
    @booking.update(status: "accepted")
    redirect_to booking_path(@booking)
  end

  def decline
    @booking.update(status: "declined")
    redirect_to booking_path(@booking)
  end

  def cancel
    @booking.update(status: "cancelled")
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

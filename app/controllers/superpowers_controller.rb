class SuperpowersController < ApplicationController
  skip_before_action :authenticate_user!, only: %w[index show]
  before_action :set_superpower, only: %w[show edit update destroy toggle_availability]

  def index
    if params[:q].nil?
      @superpowers = Superpower.where(listed: true)
    else
      @superpowers = Superpower.where("name LIKE ?", "%" + params[:q] + "%").where(listed: true)
    end

    @markers = @superpowers.geocoded.map do |superpower|
      {
        lat: superpower.latitude,
        lng: superpower.longitude,
        info_window: render_to_string(partial: "info_window", locals: {superpower: superpower}),
        image_url: helpers.asset_url("pow.png")
      }
    end
  end

  def show
  end

  def new
    @superpower = Superpower.new
  end

  def create
    @superpower = Superpower.new(superpower_params)
    @superpower.user = current_user
    if @superpower.save
      redirect_to superpower_path(@superpower)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def destroy
    @superpower.destroy
    redirect_to my_superpowers_path, status: :see_other
  end

  def update
    if @superpower.update(superpower_params)
      redirect_to superpower_path(@superpower)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def my_superpowers
    @superpowers = Superpower.where(user: current_user)
  end

  def toggle_availability
    if @superpower.listed
      @superpower.update(listed: false)
    else
      @superpower.update(listed: true)
    end
    redirect_to my_superpowers_path
  end

  private

  def set_superpower
    @superpower = Superpower.find(params[:id])
  end

  def superpower_params
    params.require(:superpower).permit(:name, :description, :category, :price_per_day, :listed, :photo)
  end
end

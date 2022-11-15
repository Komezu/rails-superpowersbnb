class SuperpowersController < ApplicationController
  skip_before_action :authenticate_user!, only: %w[index show]

  def index
    if params[:q].nil?
      @superpowers = Superpower.all
    else
      @superpowers = Superpower.where("name LIKE ?", "%" + params[:q] + "%")
    end
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

  def my_superpowers
    @superpowers = Superpower.where(user: current_user)
  end

  private

  def superpower_params
    params.require(:superpower).permit(:name, :description, :category, :price_per_day, :listed)
  end
end

class SuperpowersController < ApplicationController
  skip_before_action :authenticate_user!, only: %w[index show]

  def index
    @superpowers = Superpower.all
  end

<<<<<<< HEAD
  def show
    @superpower = Superpower.find(params[:id])
=======
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
>>>>>>> master
  end
end

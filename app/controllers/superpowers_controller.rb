class SuperpowersController < ApplicationController
  def index
    @superpowers = Superpower.all
  end
end

class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all.ordered
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def detroy
  end
end

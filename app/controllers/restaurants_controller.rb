class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all.ordered
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      respond_to do |format|
        format.html { redirect_to restaurants_path, notice: "Restaurant successfuly created." }
        format.turbo_stream { flash.now[:notice] = "Restaurant successfuly created." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @restaurant.update(restaurant_params)
      respond_to do |format|
        format.html { redirect_to restaurants_path, notice: "Restaurant successfuly updated." }
        format.turbo_stream { flash.now[:notice] = "Restaurant successfuly updated." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @restaurant.destroy
      redirect_to restaurants_path, notice: "Restaurant successfuly destroyed."
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :city, :address, :photo)
  end
end

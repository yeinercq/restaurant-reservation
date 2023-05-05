class ApiController < ActionController::API
  def health
    render json: {api: "OK"}, status: :ok
  end

  def restaurants
    @restaurants = Restaurant.all.ordered
    render json: @restaurants, status: :ok
  end

  def restaurant
    @restaurant = Restaurant.find(params[:id])
    render json: @restaurant, status: :ok
  end

  def reservations
    @restaurant = Restaurant.find(params[:id])
    @reservations = @restaurant.reservations.ordered
    render json: @reservations, status: :ok
  end

  def create_restaurant
    @restaurant = Restaurant.create!(restaurant_params)
    render json: @restaurant, status: :created
  end

  def create_reservation
    @restaurant = Restaurant.find(params[:id])
    @reservation = @restaurant.reservations.create!(reservation_params)
    render json: @reservation, status: :created
  end

  private

  def reservation_params
    params.require(:reservation).permit(:booking_date)
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :city, :address, :photo)
  end
end

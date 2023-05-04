class ReservationsController < ApplicationController
  before_action :set_restaurant
  before_action :set_reservation, only: [:edit, :update, :destroy]

  def new
    @reservation = @restaurant.reservations.build
  end

  def create
    @reservation = @restaurant.reservations.build(reservation_params)
    if @reservation.save
      respond_to do |format|
        format.html { redirect_to restaurant_path(@restaurant), notice: "Reservation successfuly created." }
        format.turbo_stream { flash.now[:notice] = "Reservation successfuly created." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @reservation.update(reservation_params)
      respond_to do |format|
        format.html { redirect_to restaurant_path(@restaurant), notice: "Reservation successfuly edited." }
        format.turbo_stream { flash.now[:notice] = "Reservation successfuly edited." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @reservation.destroy
      respond_to do |format|
        format.html { redirect_to restaurant_path(@restaurant), notice: "Reservation successfuly destroyed." }
        format.turbo_stream { flash.now[:notice] = "Reservation successfuly destroyed." }
      end
    end
  end

  private

  def set_reservation
    @reservation = @restaurant.reservations.find(params[:id])
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def reservation_params
    params.require(:reservation).permit(:booking_date)
  end
end

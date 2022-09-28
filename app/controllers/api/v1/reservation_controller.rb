class Api::V1::ReservationController < ApplicationController
  # before_action :authorize
  def index
    @my_reserves = Motorcycle.left_outer_joins(:reservations)
      .select('reservations.*, motorcycles.*, reservations.id as reservation_id, reservations.user_id as r_user_id')

    render json: ReservesSerializer.new(@my_reserves).serializable_hash[:data].map { |hash| hash[:attributes] }
  end

  def show
    @my_reserves = Motorcycle.left_outer_joins(:reservations)
      .select('reservations.*, motorcycles.*, reservations.id as reservation_id, reservations.user_id as r_user_id')
      .where("reservations.user_id = #{params[:id]}")

    render json: ReservesSerializer.new(@my_reserves).serializable_hash[:data].map { |hash| hash[:attributes] }
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      render json: { message: 'Reserved succesfuly' }
    else
      render json: { message: 'Reservation failled, Please check your params!' }
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    if @reservation.destroy
      render json: { message: 'Reserved canceled succesfuly!' }
    else
      render json: { message: 'Error while canceling reservation!' }
    end
  end

  def reservation_params
    params.require(:reserve).permit(:user_id, :total_price, :start_date, :end_date, :city, :motorcycle_id)
  end
end

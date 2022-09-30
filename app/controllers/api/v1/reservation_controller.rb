class Api::V1::ReservationController < ApplicationController
  before_action :authorize
  def index
    @my_reserves = Reservation.new
    render json: ReservesSerializer.new(@my_reserves.left_join_motorcycle).serializable_hash[:data]
      .map { |hash| hash[:attributes] }
  end

  def show
    @my_reserves = Reservation.new
    render json: ReservesSerializer.new(@my_reserves.left_joins_user(params[:id])).serializable_hash[:data]
      .map { |hash| hash[:attributes] }
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      render json: { message: 'Reserved successfully' }
    else
      render json: { message: 'Reservation failed, Please check your params!' }
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    if @reservation.destroy
      render json: { message: 'Reserved canceled successfully!' }
    else
      render json: { message: 'Error while canceling reservation!' }
    end
  end

  private

  def reservation_params
    params.require(:reserve).permit(:user_id, :total_price, :start_date, :end_date, :city, :motorcycle_id)
  end
end

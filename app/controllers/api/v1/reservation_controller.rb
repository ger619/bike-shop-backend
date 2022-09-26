class Api::V1::ReservationController < ApplicationController
  before_action :authorize
  def index
    @reservations = Motorcycle.left_outer_joins(:reservations)
      .select('reservations.*, motorcycles.*, reservations.id as reservation_id')

    render json: { reservations: @reservations }
  end

  def show; end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params.merge(user: authorized_user,
                                                            motorcycle: Motorcycle.find(params[:motorcycle_id])))
    if @reservation.save
      render json: { message: 'Reserved succesfully' }
    else
      render json: { message: 'Reservation failed, Please check your params!' }
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    if @reservation.destroy
      render json: { message: 'Reserved canceled succesfully!' }
    else
      render json: { message: 'Error while canceling reservation!' }
    end
  end

  def reservation_params
    params.permit(:user_id, :total_price, :start_date, :city, :motorcycle_id)
  end
end

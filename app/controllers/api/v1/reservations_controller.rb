class Api::V1::ReservationsController < ApplicationController
  def index
  end

  def show
  end  

  def update
    @motorcycle = Motorcycle.find(params[:motorcycle_id])
    if @motorcycle.reserved  == false
      if @motorcycle.update(reserved: true)
         render json: {message: "Reserved #{@motorcycle.brand} successfully!"}
      else
        render json: {message: "Update failled, Please check your params!"}
      end  
    else
      if @motorcycle.update(reserved: false)
        render json: {message: "Reservation of #{@motorcycle.brand} successfully cancelled!"}
      else
        render json: {message: "Error while cancel reservation, Please check your params!"}
      end
    end  
  end
end

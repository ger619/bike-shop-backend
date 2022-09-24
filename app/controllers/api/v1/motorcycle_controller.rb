class Api::V1::MotorcycleController < ApplicationController
  before_action :authorize
  # before_action :set_motorcycle, only: %i[show update destroy]

  def index
    @motorcycle = @user.motorcycles.all
    render json: @motorcycle
    # http://127.0.0.1:3000/api/v1/motorcycles
  end

  def show
    @motorcycle = Motorcycle.find(params[:id])
    render json: @motorcycle
    # http://127.0.0.1:3000/api/v1/motorcycles/1
  end

  def create
    @motorcycle = Motorcycle.new(motorcycle_params.merge(user: authorized_user))
    if @motorcycle.save
      render json: { message: 'Added succesfuly' }
    else
      render json: { message: 'Internal Server error. Please check your params' }
    end
  end

  def destroy
    @motorcycle = Motorcycle.find(params[:id])
    @motorcycle.destroy
  end

  private

  def motorcycle_params
    params.require(:motorcycle).permit(:user_id, :brand, :model, :year, :image, :description, :booking_fee, :reserved)
  end
end

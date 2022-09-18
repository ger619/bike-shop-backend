class Api::V1::MotorcycleController < ApplicationController
  def index
    @motorcycle = Motorcycle.all
    render json: @motorcycle
  end
end

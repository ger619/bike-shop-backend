class Api::V1::CategoryController < ApplicationController
  def index
    @categories = Category.all
    render json: @categories
  end

  def show
    @motorcycles = Motorcycle.where(category_id: params[:id])
    render json: @motorcycles
  end
end

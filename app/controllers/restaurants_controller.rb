class RestaurantsController < ApplicationController

  def index
    # if a category is defined, return the restaurants for that category
    # else return all restaurants
    @category = params[:category]
    if @category.present?
      @restaurants = Restaurant.where(category: @category)
    else
      @restaurants = Restaurant.all
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to @restaurant
    else
      render :new
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :category, :phone_number)
  end

end

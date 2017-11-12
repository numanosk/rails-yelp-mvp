class Admin::ReviewsController < ApplicationController
  before_action :find_restaurant, only: [ :edit, :update, :destroy ]
  before_action :find_review, only: [ :edit, :update, :destroy ]

  def edit
  end

  def update
    @review.update(review_params)
    redirect_to admin_restaurant_path(@restaurant)
  end

  def destroy
    @review.destroy
    redirect_to admin_restaurant_path(@restaurant)
  end


  private

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def find_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end

end

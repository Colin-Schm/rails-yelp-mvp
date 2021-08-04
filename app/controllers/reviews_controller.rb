class ReviewsController < ApplicationController
	before_action :get_params_reviews, only: [:show, :edit, :update, :destroy]

	def index
		@reviews = Review.all
	end

	def new
		@restaurant = Restaurant.find(params[:restaurant_id])
		@review = Review.new	
	end

	def create
		@review = Review.new(review_params)
		@restaurant = Restaurant.find(params[:restaurant_id])
    @review.restaurant = @restaurant
		@review.save
		redirect_to restaurant_path(@restaurant)
	end

	def destroy
		@review.destroy
		redirect_to restaurants_path
	end

	def get_params_reviews
		@review = Review.find(params[:id])
	end

	private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end

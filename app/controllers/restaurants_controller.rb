class RestaurantsController < ApplicationController

	before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

	def index
		@restaurants = Restaurant.all
	end

	def show
	end

	def new
		@restaurant = Restaurant.new	
	end

	def create
		@restaurant.save
		redirect_to restaurant_path(@restaurant)
	end

	def edit
	end

	def update
		@restaurant.update(params[:restaurant])
		redirect_to restaurant_path(@restaurant)
	end

	def destroy
		@restaurant.destroy
		redirect_to restaurants_path
	end

	def get_params
		@restaurant = Restaurant.find(params[:id])
	end

	private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end

class FavoritesController < ApplicationController
		before_action :find_favorite, only: [:show, :destroy]
		before_action :authenticate_user!

	def index
		@favorites = @user.favorites.all
		render :index
	end

	def new
		@favorite = Favorite.new
	end

	def create
		@favorite = Favorite.new(params.require(:favorite))
		@favorite.user = current_user
	end

	def show
		@favorite = Favorite.find(params[:id])
	end

	def destroy
		@article.destroy
	end

private
	
	def find_favorite
	@favorite = Favorite.find(params[:id])
	end

end

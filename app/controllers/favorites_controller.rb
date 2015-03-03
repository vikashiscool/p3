class FavoritesController < ApplicationController
		before_action :find_favorite, only: [:show]
		before_action :authenticate_user!

	def index
		@user = current_user
		# @videos = @user.videos.all
  # 	@user = current_user
		@favorites = current_user.favorites
		# Pass object that contains both the video url & the favorite id to the view
		@video_favs = @favorites.map do |favorite|
			{ fav_id: favorite.id, video_url: Video.find(favorite.video_id).url }
		end
		render :index
	end

	def create
		# Create the video
		@video = Video.create({url: params[:url]})
		# Create the favorite association
		current_user.favorites.create({video_id: @video.id, user_id: current_user.id})
		flash.now[:alert] = 'weee'
		redirect_to user_favorites_path(current_user)
	end

	def destroy
		# Find favorite
		favorite = Favorite.find(params[:id])
		# Delete favorite from user's favorites
		current_user.favorites.delete(favorite)
		# Redirect back to user's favorites page
		# redirect_to :back, method: :get # still not reloading...
		redirect_to user_favorites_path(current_user.id)
	end

private
	
	def find_favorite
		@favorite = Favorite.find(params[:id])
	end

	def favorite_params
		params.require(:favorite).permit(:user_id, :url, :video_id)
	end

end

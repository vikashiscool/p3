class VideosController < ApplicationController
	before_action :authenticate_user!

  def index
  	@videos = @user.videos.all
  	# render :index
  end

  def search
		dev_key = 'AI39si79lSHUqU8o_xFVcG3h6YyAbMbnoBatUqb8mA45r_t-D47Wp_JK9a-xPHuNjrlQa27aEvhRMomNBg4nF93s6KMSriPCNQ'

  	search_term = params[:search]
  	search = Typhoeus.get(
  		'https://gdata.youtube.com/feeds/api/videos',
  		params: {
  			q: search_term,
  			category: 'Education',
  			key: dev_key,
  			alt: 'json'
  		}
  	)

  	response = JSON.parse(search.body)

		results = response["feed"]["entry"]

		#Get Video IDs from YouTube API (e.g. "-")
		ids = results.map do |result|
			result["id"]["$t"].split("/")[6]
		end

		#Pass the view only the first 10
		@ids = ids.first(10)
	end

	def new
		@video = Video.new
	end

	def create
		@video = Video.new(params.require(:video))
		@video.user = current_user
	end

	def destroy
		@video.destroy
	end

		# @result = @results["feed"]["entry"][0]["link"][0]["href"]

		# render :json => @results

end




# <% 1.upto(10).each do |n| %>

# 	<embed width="420" height="315" src="<%= @results[n]["link"][0]["href"] %>">


# <% end %>

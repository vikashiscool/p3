class WelcomeController < ApplicationController
  def index
		search_term = 'ruby'

		dev_key = 'AI39si79lSHUqU8o_xFVcG3h6YyAbMbnoBatUqb8mA45r_t-D47Wp_JK9a-xPHuNjrlQa27aEvhRMomNBg4nF93s6KMSriPCNQ'

		search = Typhoeus.get('https://gdata.youtube.com/feeds/api/videos?q='+search_term+'&key='+dev_key+'&alt=json')

		@response = JSON.parse(search.body)

		@results = @response["feed"]["entry"]

		# @result = @results["feed"]["entry"][0]["link"][0]["href"]


		# render :json => @results
  end
end

# <% 1.upto(10).each do |n| %>

# 	<embed width="420" height="315" src="<%= @results[n]["link"][0]["href"] %>">


# <% end %>

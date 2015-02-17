class Comment < ActiveRecord::Base
	validate :body, presence: true

	belongs_to :user
	belongs_to :favorite
	
end

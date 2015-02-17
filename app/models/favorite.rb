class Favorite < ActiveRecord::Base

  # Relationships
	belongs_to :user
	has_many :comments, dependent: :destroy #deletes comments if favorite is destroyed	

end

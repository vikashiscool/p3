class AddUserIDandFavoriteIDtoComments < ActiveRecord::Migration
  def change
  	add_reference :comments, :user, index: true
  	add_reference :comments, :favorite, index: true
  end
end

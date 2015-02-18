class AddColumnToFavoritesTable < ActiveRecord::Migration
  def change
    add_column :favorites, :url, :string
  end
end

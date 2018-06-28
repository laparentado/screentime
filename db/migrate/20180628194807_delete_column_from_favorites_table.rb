class DeleteColumnFromFavoritesTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :favorites, :tmdb_id
  end
end

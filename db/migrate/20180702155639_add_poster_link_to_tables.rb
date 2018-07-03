class AddPosterLinkToTables < ActiveRecord::Migration[5.2]
  def change
    add_column :favorites, :poster, :string
    add_column :want_movies, :poster, :string
    add_column :want_shows, :poster, :string
    add_column :watched_shows, :poster, :string
    add_column :watcheds, :poster, :string
  end
end

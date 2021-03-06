class CreateWatchedShows < ActiveRecord::Migration[5.2]
  def change
    create_table :watched_shows do |t|
      t.integer :user_id
      t.integer :tmdb_id
      t.string :title
      t.string :overview
      t.string :notes
      t.timestamps
    end
  end
end

class CreateWantMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :want_movies do |t|
      t.integer :user_id
      t.integer :tmdb_id
      t.string :title
      t.string :overview
      t.string :notes
      t.timestamps
    end
  end
end

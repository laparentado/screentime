class FavoritesController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @favs = Favorite.where(user_id: current_user.id)
    Tmdb::Api.key(ENV["movie_db_key"])

    @configuration = Tmdb::Configuration.new
    @configuration.base_url
    @configuration.poster_sizes
    @configuration.profile_sizes

  end

  def show
    @fav = Favorite.find(params[:id])
    Tmdb::Api.key(ENV["movie_db_key"])

    @configuration = Tmdb::Configuration.new
    @configuration.base_url
    @configuration.poster_sizes
    @configuration.profile_sizes
  end

  def edit
    @fav = Favorite.find(params[:id])

  end

  def update
    @fav = Favorite.find(params[:id])
    if @fav.update(fav_params)
      redirect_to favorites_path
    else
      render edit_favorite_path
    end

  end

  def destroy
    @fav = Favorite.find(params[:id])
    @fav.destroy
    redirect_to "/favorites"

  end

  private
  def fav_params
    params.require(:favorite).permit(:user_id, :title, :overview, :notes, :poster)
  end
end

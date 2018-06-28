class FavoritesController < ApplicationController
  def index
    @favs = Favorite.where(user_id: current_user.id)
  end

  def show
    @fav = Favorite.find(params[:id])
  end

  def edit
    @fav = Favorite.find(params[:id])

  end

  def update
    @fav = Favorite.find(params[:id])
    if @fav.update(fav_params)
      redirect_to "/favorites"
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
    params.require(:favorite).permit(:user_id, :title, :overview, :notes)
  end
end
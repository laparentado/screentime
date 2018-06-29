class WantMoviesController < ApplicationController
  def index
    @want_show = WantShow.where(user_id: current_user.id)
    @want_movie = WantMovie.where(user_id: current_user.id)

  end

  def list_movie
    m = WantMovie.new(list_movie_params)
    m.title = params[:title]
    m.overview = params[:overview]
    m.tmdb_id = params[:tmdb_id]
    m.user_id = current_user.id 
    if m.save
      flash[:notice] = "added movie to want list"
      redirect_back(fallback_location: root_path)
    else
      render "/search/index"
    end
  end

  def show
    @movie = WantMovie.find(params[:id])
  end

  def edit
  end

  private
  def list_movie_params
    params.require(:want_movies).permit(:user_id, :tmdb_id, :title, :overview, :notes)
  end
end

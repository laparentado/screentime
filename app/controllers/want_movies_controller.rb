class WantMoviesController < ApplicationController
  def index
    @want_show = WantShow.where(user_id: current_user.id)
    @want_movie = WantMovie.where(user_id: current_user.id)
    @user = User.find(current_user.id)

  end

  def list_movie
    m = WantMovie.new(list_movie_params)
    m.title = params[:title]
    m.overview = params[:overview]
    m.tmdb_id = params[:tmdb_id]
    m.user_id = current_user.id 
    m.poster = params[:poster]
    if m.save
      flash[:notice] = "added movie to want list"
      redirect_back(fallback_location: root_path)
    else
      render "/search/index"
    end
  end

  def watch_movie
    m = Watched.new(watch_movie_params)
    m.title = params[:title]
    m.overview = params[:overview]
    m.tmdb_id = params[:tmdb_id]
    m.user_id = current_user.id 
    m.poster = params[:poster]
    if m.save
      @d = WantMovie.where(tmdb_id: m.tmdb_id)
      @id = @d.first.id 
      @double = WantMovie.find(@id)
      @double.destroy
      flash[:notice] = "moved movie to watched list"
      redirect_back(fallback_location: root_path)
    else
      render "/search/index"
    end
  end

  def show
    @movie = WantMovie.find(params[:id])
    Tmdb::Api.key(ENV["movie_db_key"])

    @configuration = Tmdb::Configuration.new
    @configuration.base_url
    @configuration.poster_sizes
    @configuration.profile_sizes
  end

  def edit
    @movie = WantMovie.find(params[:id])
  end
  def update
    @movie = WantMovie.find(params[:id])
    if @movie.update(edit_movie_params)
      redirect_to want_movie_path
    else
      render edit_want_movie_path
    end
  end

  def destroy
    @movie = WantMovie.find(params[:id])
    @movie.destroy
    redirect_to "/want_movies"
  end

  private
  def list_movie_params
    params.require(:want_movies).permit(:user_id, :tmdb_id, :title, :overview, :notes, :poster)
  end
  def edit_movie_params
    params.require(:want_movie).permit(:user_id, :tmdb_id, :title, :overview, :notes, :poster)
  end
  def watch_movie_params
    params.require(:watched).permit(:user_id, :tmdb_id, :title, :overview, :notes, :poster)
  end
end

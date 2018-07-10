class WatchedsController < ApplicationController
  def new
  end

  def assign
    a = Watched.new(watched_params)
    a.title = params[:title]
    a.overview = params[:overview]
    a.tmdb_id = params[:tmdb_id]
    a.user_id = current_user.id 
    a.poster = params[:poster]
    if a.save
      flash[:notice] = "added movie to watched list"
      redirect_back(fallback_location: root_path)
    else
      render "/search/index"
    end
  end

  def shown
    s = WatchedShow.new(show_params)
    s.title = params[:title]
    s.overview = params[:overview]
    s.tmdb_id = params[:tmdb_id]
    s.user_id = current_user.id
    s.poster = params[:poster]
    if s.save
      flash[:notice] = "added show to watched list"
      redirect_back(fallback_location: root_path)
    else
      render "/search/index"
    end
  end

  def favorite
    f = Favorite.new(fav_params)
    f.title = params[:title]
    f.overview = params[:overview]
    f.poster = params[:poster]
    f.user_id = current_user.id
    if f.save
      flash[:notice] = "added to favorites"
      redirect_back(fallback_location: root_path)
    else
      render "/search/index"
    end
  end

  def index
    @user = User.find(current_user.id)
    @watched = Watched.where(user_id: current_user.id)
    @watched_show = WatchedShow.where(user_id: current_user.id)
  end

  def show
    Tmdb::Api.key(ENV["movie_db_key"])

    @movie = Watched.find(params[:id])
    tmdb_id = Watched.find(params[:id]).tmdb_id
    @recs = Tmdb::Movie.similar_movies(tmdb_id)

    @configuration = Tmdb::Configuration.new
    @configuration.base_url
    @configuration.poster_sizes
    @configuration.profile_sizes
  end

  def edit
    @movie = Watched.find(params[:id])
  end

  def update
    @movie = Watched.find(params[:id])
    if @movie.update(watched_params)
      redirect_to watched_path
    else
      render edit_watched_path
    end
  end

  def destroy
    @movie = Watched.find(params[:id])
    @movie.destroy
    redirect_to "/watcheds"
  end

  private
  def watched_params
    params.require(:watched).permit(:user_id, :tmdb_id, :title, :overview, :notes, :poster)
  end
  def show_params
    params.require(:watched_show).permit(:user_id, :tmdb_id, :title, :overview, :notes, :poster)
  end
  def fav_params
    params.require(:favorite).permit(:user_id, :title, :overview, :notes, :poster)
  end

end

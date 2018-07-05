class WantShowsController < ApplicationController
  def index
    @want_show = WantShow.where(user_id: current_user.id)
  end

  def list_show
    s = WantShow.new(list_show_params)
    s.title = params[:title]
    s.overview = params[:overview]
    s.tmdb_id = params[:tmdb_id]
    s.user_id = current_user.id 
    s.poster = params[:poster]
    if s.save
      flash[:notice] = "added show to want list"
      redirect_back(fallback_location: root_path)
    else
      render "/search/index"
    end
  end

  def watch_show
    s = WatchedShow.new(watch_show_params)
    s.title = params[:title]
    s.overview = params[:overview]
    s.tmdb_id = params[:tmdb_id]
    s.user_id = current_user.id
    s.poster = params[:poster]
    if s.save
      @ds = WantShow.where(tmdb_id: s.tmdb_id)
      @ids = @ds.first.id
      @doubleshow = WantShow.find(@ids)
      @doubleshow.destroy
      flash[:notice] = "moved show to watched list"
      redirect_back(fallback_location: root_path)
    else
      render "/search/index"
    end
  end

  def show
    @show = WantShow.find(params[:id])
    @configuration = Tmdb::Configuration.new
    @configuration.base_url
    @configuration.poster_sizes
    @configuration.profile_sizes
  end

  def edit
    @show = WantShow.find(params[:id])
  end

  def update
    @show = WantShow.find(params[:id])
    if @show.update(list_show_params)
      redirect_to "/want_movies"
    else
      render edit_want_show_path
    end
  end

  def detmdb_id
    @show = WantShow.find(params[:id])
    @show.destroy
    redirect_to "/want_movies"
  end

  private
  def list_show_params
    params.require(:want_shows).permit(:user_id, :tmdb_id, :title, :overview, :notes, :poster)
  end
  def watch_show_params
    params.require(:watched_show).permit(:user_id, :tmdb_id, :title, :overview, :notes, :poster)
  end
end

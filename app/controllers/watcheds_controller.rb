class WatchedsController < ApplicationController
  def new
  end

  def assign
    a = Watched.new(watched_params)
    a.title = params[:title]
    a.overview = params[:overview]
    a.tmdb_id = params[:tmdb_id]
    a.user_id = current_user.id 
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
    if s.save
      flash[:notice] = "added show to watched list"
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
    @movie = Watched.find(params[:id])
  end

  def edit
    @movie = Watched.find(params[:id])
  end

  def update
    @movie = Watched.find(params[:id])
    if @movie.update(watched_params)
      redirect_to "/watcheds"
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
    params.require(:watched).permit(:user_id, :tmdb_id, :title, :overview, :notes)
  end
  def show_params
    params.require(:watched_show).permit(:user_id, :tmdb_id, :title, :overview, :notes)
  end
end

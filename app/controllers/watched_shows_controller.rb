class WatchedShowsController < ApplicationController
  def show
    @show = WatchedShow.find(params[:id])
  end

  def edit
    @show = WatchedShow.find(params[:id])
  end
  
  def update
    @show = WatchedShow.find(params[:id])
    if @show.update(show_params)
      redirect_to "/watcheds"
    else
      render edit_watched_show_path
    end
  end

  def destroy
    @show = WatchedShow.find(params[:id])
    @show.destroy
    redirect_to "/watcheds"
  end

  private
  def show_params
    params.require(:watched_show).permit(:user_id, :tmdb_id, :title, :overview, :notes)
  end
end

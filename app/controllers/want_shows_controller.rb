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
    if s.save
      flash[:notice] = "added show to want list"
      redirect_back(fallback_location: root_path)
    else
      render "/search/index"
    end
  end

  def show
    @show = WantShow.find(params[:id])
  end

  def edit
  end

  private
  def list_show_params
    params.require(:want_shows).permit(:user_id, :tmdb_id, :title, :overview, :notes)
  end
end

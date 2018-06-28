class SearchesController < ApplicationController
  def index
    Tmdb::Api.key(ENV["movie_db_key"])
    if params[:q].present?
    @movies = Tmdb::Movie.find(params[:q])
    @shows = Tmdb::TV.find(params[:q])
    end
  end

  def show
     
  end
end

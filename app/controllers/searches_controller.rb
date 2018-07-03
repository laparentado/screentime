class SearchesController < ApplicationController
  def index
    Tmdb::Api.key(ENV["movie_db_key"])
    if params[:q].present?
    @movies = Tmdb::Movie.find(params[:q])
    @shows = Tmdb::TV.find(params[:q])

    end
    @popular = Tmdb::Movie.top_rated
    @popularTV = Tmdb::TV.top_rated

 
  end

  def show
     
  end
end

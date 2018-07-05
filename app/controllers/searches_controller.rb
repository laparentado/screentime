class SearchesController < ApplicationController
  def index
    Tmdb::Api.key(ENV["movie_db_key"])
    if params[:q].present?
    @movies = Tmdb::Movie.find(params[:q])
    @shows = Tmdb::TV.find(params[:q])

    end
    @popular = Tmdb::Movie.popular
    @popularTV = Tmdb::TV.popular
    @configuration = Tmdb::Configuration.new
    @configuration.base_url
    @configuration.poster_sizes
    @configuration.profile_sizes

 
  end

  def show
     
  end
end

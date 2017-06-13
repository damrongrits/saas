# This file is app/controllers/movies_controller.rb
class MoviesController < ApplicationController
  def index
    @movies = Movie.all
    order = params[:order]
    if order == 'title'
      @movies = Movie.order('title ASC')
    elsif order == 'release_date'
      @movies = Movie.order('release_date ASC')
    elsif order == 'rating'
      @movies = Movie.order('rating ASC')
    end
  end

  # in app/controllers/movies_controller.rb
  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    render(:partial => 'movie', :object => @movie) if request.xhr?
    # will render app/views/movies/show.<extension> by default
  end

  # replaces the 'create' method in controller:
  def create
    @movie = Movie.new(params[:movie])
    if @movie.save
      flash[:notice] = "#{@movie.title} was successfully created."
      redirect_to movies_path
    else
      render 'new' # note, 'new' template can access @movie's field values!
    end
  end

  # replaces the 'update' method in controller:
  def update
    @movie = Movie.find params[:id]
    if @movie.update_attributes(params[:movie])
      flash[:notice] = "#{@movie.title} was successfully updated."
      redirect_to movie_path(@movie)
    else
      render 'edit' # note, 'edit' template can access @movie's field values!
    end
  end

  # as a reminder, here is the original 'new' method:
  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

  def search_tmdb
    title = params[:search_terms]
    @movies = Movie.find_in_tmdb(title)
    if @movies.empty?
     flash[:notice] = "'#{params[:search_terms]}' was not found in TMDb."
     redirect_to movies_path
    end
  end
end

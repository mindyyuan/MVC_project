require 'pry'

class Actor

attr_reader :name, :movies, :genres, :directors
@@all = []

  def initialize(name)
    @name = name
    @movies = []
    @genres = []
    @directors = []
  end

  def add_movie(title)
    self.movies << title
  end

  def populate_genres
    @genres = self.movies.map do |title|
      genre_objects = Movie.find_by_name(title).genres
      genre_objects.each { |genre_object| genre_object.actors << self.name}
      genre_objects.map { |genre_object| genre_object.name}
    end.flatten.uniq
  end

  def populate_directors
    @directors = self.movies.map do |title|
      director = Movie.find_by_name(title).director
      director.actors << self.name
      director.name
    end.flatten.uniq
  end


end
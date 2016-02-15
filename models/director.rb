require 'pry'

class Director

attr_reader :name, :movies, :genres, :actors
@@all = []

  def initialize(name)
    @name = name
    @movies = []
    @@all << self
    @genres = []
    @actors = []
  end

  def add_movie(title)
    self.movies << title
  end

  def populate_genres
    @genres = self.movies.map do |title|
      genre_objects = Movie.find_or_create_by_name(title).genres
      genre_objects.each { |genre_object| genre_object.directors << self.name}
      genre_objects.map { |genre_object| genre_object.name}
    end.compact.flatten.uniq
  end

  def populate_actors
    @actors = self.movies.map do |title|
      actor_objects = Movie.find_or_create_by_name(title).actors
      actor_objects.each { |actor_object| actor_object.directors << self.name}
      actor_objects.map { |actor_object| actor_object.name}
    end.compact.flatten.uniq
  end

  def self.all
    @@all
  end
end

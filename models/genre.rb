require 'pry'

class Genre

attr_reader :name, :movies, :directors, :actors
@@all = []

  def initialize(name)
    @name = name
    @movies = []
    @@all << self
    @directors = []
    @actors = []
  end

  def add_movie(title)
    self.movies << title
  end

  def populate_directors
    @directors = self.movies.map do |title|
      director = Movie.find_by_name(title).director
      director.genres << self.name
      director.name
    end.flatten.uniq
  end

  def populate_actors
    @actors =self.movies.map do |title|
      actor_objects = Movie.find_by_name(title).actors
      actor_objects.each { |actor_object| actor_object.genres << self.name}
      actor_objects.map { |actor_object| actor_object.name}
    end.flatten.uniq
  end

end

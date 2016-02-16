require 'pry-byebug'

class Genre
  extend Populatable
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

  # def populate_directors
  #   @directors = self.movies.map do |title|
  #     director = Movie.find_or_create_by_name(title).director
  #     if director
  #       director.genres << self.name
  #       director.name
  #     end
  #   end.compact.flatten.uniq
  # end

  def populate_actors
    @actors =self.movies.map do |title|
      actor_objects = Movie.find_or_create_by_name(title).actors
      actor_objects.each { |actor_object| actor_object.genres << self.name}
      actor_objects.map { |actor_object| actor_object.name}
    end.compact.flatten.uniq
  end

end

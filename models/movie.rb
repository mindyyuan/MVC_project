require 'pry'

class Movie
extend Findable
attr_accessor :rating, :director, :actors, :genres
attr_reader :title
@@all = []

  def initialize(title, director = nil, rating = 5.0)
    @title = title
    @rating = rating
    @actors = []
    @genres = []
    @@all << self

    if director
      add_director(director)
    end
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def add_director(director)
    self.director = director
    director.add_movie(self.title)
    director.populate_genres
    director.populate_actors
  end

  def add_actor(actor)
    self.actors << actor
    actor.add_movie(self.title)
    actor.populate_genres
    actor.populate_directors
  end

  def add_genre(genre)
    self.genres << genre
    genre.add_movie(self.title)
    genre.populate_directors
    genre.populate_actors
  end
end

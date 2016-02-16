require 'pry'

class Actor

attr_accessor :name, :movies, :genres, :directors
@@all = []
include Populate

  def initialize(name)
    @name = name
    @movies = []
    @genres = []
    @directors = []
  end

  def add_movie(title)
    self.movies << title
  end


end
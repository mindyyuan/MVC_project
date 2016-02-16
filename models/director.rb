require 'pry'

class Director
  

  attr_accessor :name, :movies, :genres, :actors
  include Populate

  @@all = []

  def self.all
    @@all
  end

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

end

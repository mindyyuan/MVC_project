require 'pry'

class Genre

  attr_accessor :name, :movies, :directors, :actors
  @@all = []

  include Populate

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



end

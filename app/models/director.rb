require 'pry'

class Director

  attr_accessor :name, :movies, :genres, :actors
  include Populate

  @@all=[]

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @@all << self
    @movies = []
    @genres = []
    @actors = []
  end

  def add_movie(title)
    self.movies << title
  end

end

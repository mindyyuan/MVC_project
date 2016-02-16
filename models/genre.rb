require 'pry'

class Genre

  attr_accessor :name, :movies, :directors, :actors
  include Populate
  
  @@all=[]

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @@all << self
    @movies = []
    @directors = []
    @actors = []
  end

  def add_movie(title)
    self.movies << title
  end

end

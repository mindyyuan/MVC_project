module Searchable

  # returns a movie object
  def find_by_title(title)
    self.all.detect { |movie| movie.title == title }
  end

# Movie.find_by("actors", "Emile Hirsch")
# returns an array
  def search_by(aspect, name)
    self.all.select { |movie| movie.send(aspect).include?(name) }
  end

# Movie.cross_reference("actors", "Bill Murray", "director", "Wes Anderson")
# returns an array
  def cross_reference(aspect1, name1, aspect2, name2)
    self.search_by(aspect1, name1) & self.search_by(aspect2, name2)
  end

  def find_incomplete
    self.all.select do |movie|
      movie.director == "Unknown" || movie.actors == [] || movie.genres == []
    end
  end

  def delete(title)
    doomed_film = Movie.find_by_title(title)
    Director.find_and_delete(doomed_film.director, title)
    doomed_film.actors.each { |name| Actor.find_and_delete(name, title) }
    doomed_film.genres.each { |name| Genre.find_and_delete(name, title) }
    self.all.delete(doomed_film)
    "#{title} has been deleted from your movie collection"
  end


end
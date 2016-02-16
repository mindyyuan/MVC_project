module Populatable
  def populate_directors(element)
    @directors = self.movies.map do |title|
      director = Movie.find_or_create_by_name(title).director
      if director
        director.element << self.name
        director.name
      end
    end.compact.flatten.uniq
  end
end

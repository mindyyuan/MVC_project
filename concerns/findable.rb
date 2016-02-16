module Findable

def find_by_name(title)
    all.find {|movie| movie.title == title}
end

def find_or_create_by_name(title)
  movie = find_by_name(title)
  movie ||= Movie.new(title)
end

end

module Findable


def find_by_name(title)
    all.find {|movie| movie.title == title}
  end

end

require 'pry'
module Populate

  def populate(resource, current_class)

    self.movies.map do |title|
      objects = Movie.find_or_create_by_name(title).send(resource)
      
      if objects.is_a? Array
        objects.each {|object| object.send(current_class) << self.name }
        objects.map { |object| object.name}
      
      elsif objects
        objects.send(current_class) << self.name
        objects.name
      end

    end.compact.flatten.uniq
  end

end

require 'pry-byebug'
django = Movie.new("django")

western = Genre.new("western")

quentin = Director.new("quentin")

jamie = Actor.new("jamie foxx")

django.add_actor(jamie)
django.add_director(quentin)
django.add_genre(western)



Pry.start

puts "hello"

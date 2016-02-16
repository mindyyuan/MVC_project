require_relative '../config/environment.rb'
require_relative '../tools/seed.rb'

action = ""
resource = ""
until resource == 'exit' || action == 'exit'
  puts 'what would you like to act on? (movie, director, actor, genre)'
  resource = gets.chomp.downcase

end
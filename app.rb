require 'bundler'
Bundler.require

#require_relative 'lib/game'
require_relative 'lib/player'

#Initialise les joueurs
  player1 = Player.new("Hwarang")
  player2 = Player.new("Yoshimitsu")

#Présente les protagonistes
  puts "À ma droite Hwarang"
  puts "Hwarang 23 ans, célibataire, libre comme l'air"
  puts "-------------------------------------------------"
  puts "On vous annonce fièrement que :"
  puts  player1.show_state
  puts "############"
  puts "############"
  puts "############"
  puts "À ma gauche Yoshimitsu"
  puts "Yoshimitsu 28 ans, célibataire, polylovers"
  puts "-------------------------------------------------"
  puts "On vous annonce fièrement que : "
  puts player2.show_state


#Boucle pour orchestrer le combat
while player1.life_points > 0 && player2.life_points > 0 do
  player1.attacks(player2)
 
  if player2.life_points <= 0 
    break
  end

  player2.attacks(player1)
  if player1.life_points <= 0 
    break
  end

end

binding.pry
puts "fin du game" 
require 'bundler'
Bundler.require

#require_relative 'lib/game'
require_relative 'lib/player'

puts "-----------------------------------------------------"
puts "|Bienvenue sur  MOOTHAFUKERZ 2, le retour des vaches|"
puts "|Kill all the cows! Now, get a mooooove on!         |"
puts "-----------------------------------------------------"


#Joueur Humain -  Initilisation du joueur HumanPlayer
puts "What's your name cowboy ?"
player_name = gets.chomp
player1 = HumanPlayer.new(player_name)

print "> Howdy, #{player1.name}!!\n\n"

#NPCs - Initialisation des NPCs
player2 = Player.new("Vache 1")
player3 = Player.new("Vache 2")
ennemies = [player2, player3]

#MENU
def menu(player1, player2, player3)
  puts player1.show_state
  puts "C'est votre tour #{player1.name}. Que voulez-vous faire ?"
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner"
  # Si les points de vie du  NPC 2 sont nuls, il n'apparait plus dans le menu
  if player2.life_points > 1
    puts "1 - pour attaquer Hector the bull qui à #{player2.life_points} points de vie"
  end
    # Si les points de vie du  NPC 3 sont nuls, il n'apparait plus dans le menu
  if player3.life_points > 1
    puts "2 - pour attaquer Dolly the cow qui à #{player3.life_points} points de vie"
  end
  print "> "

  choice = gets.chomp

  # la fonction case permet de faire fonctionner le menu
  case choice
    when 'a'
      player1.search_weapon
    when 's'
      player1.search_health_pack
    when '1'
      player1.attacks(player2)
    when '2'
      player1.attacks(player3)
    else
      puts "Oups. T'as quand même énervé les vaches.\n\n"
  end

end

# COMBAT !
# la fonction while est initialisé de tel sorte qu'après chaque tour, on repart à partir du menu
while player1.life_points > 0 && (player2.life_points > 0 || player3.life_points > 0)
  menu(player1, player2, player3)

  ennemies.each do |ennemy|
    if ennemy.life_points >= 0
      puts "Les vaches vous attaquent !"
      ennemy.attacks(player1)
    end
  end

end

#FIN DE PARTIE
puts "La partie est finie"
if player1.life_points > 0
  puts "You're a real cowboy YEEEEHAAAAAA !"
else
  puts "#{player1.name} has 0 life points remaining."
  puts "you have lost, looooser!"
end


binding.pry
puts "fin du game" 

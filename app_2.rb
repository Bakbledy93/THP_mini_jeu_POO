require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "-----------------------------------------------------"
puts "|Bienvenue sur  MOOTHAFUKERZ 2, le retour des vaches|"
puts "|Kill all the cows! Now, get a mooooove on!         |"
puts "-----------------------------------------------------"


#Joueur Humain
puts "What's your name cowboy ?"
player_name = gets.chomp
player1 = HumanPlayer.new(player_name)

print "> Howdy, #{player1.name}!!\n\n"

#NPCs
player2 = Player.new("Hector the bull")
player3 = Player.new("Dolly the cow")
ennemies = [player2, player3]

#combat
puts "Let's get ready to rumble!!\n\n"

while player1.life_points >0 && (player2.life_points > 0 || player3.life_points >0)
puts "\n\n"
puts "A toi de jouer #{player1.name}, tu veux ?"    #menu options
puts "---------------------------"
puts "a - tester une nouvelle arme"
puts "s - se soigner"
puts "\n\n"
puts "Attaquer une vache en vue :"
puts "---------------------------"
puts "0 - pour attaquer Hector the bull qui à #{player2.life_points} points de vie"
puts "1 - pour attaquer Dolly the cow qui à #{player3.life_points} points de vie"
puts "\n\n"
decision = gets.chomp.to_s    # menu
if decision == "a" 
  decision = player1.search_weapon  #si le jouer décide de chercher une meilleur arme

elsif decision == "s"
 decision = player1.search_health_pack  #si le jouer décide de chercher un health pack

 elsif decision == "0" 
  # decision = player1.attacks(player2)   #si le jouer décide d'attaquer Hector the bull

 elsif decision == "1"
  # decision = player1.attacks(player3)   #si le jouer décide d'attaquer Dolly the cow
 end


  if decision == "0" || decision =="1"   # execution de l'attaque
    if decision =="0"
      if player1.life_points > 0  && player2.life_points > 0
      decision = player1.attacks(player2) 
      puts player1.show_state
      end

      if player2.life_points <= 0 && player3.life_points <= 0   # si les deux vaches meurent
        break
      end

      if player2.life_points > 0 && player1.life_points > 0    
      player2.attacks(player1)
      puts player1.show_state
      end

      if player1.life_points <= 0 
        break
      end

    elsif decision =="1"

      if  player1.life_points > 0 && player3.life_points >0
        decision = player1.attacks(player3)
        puts player1.show_state
      end

      if player3.life_points <= 0 && player2.life_points <= 0 
        break
      end

      if player3.life_points > 0 && player1.life_points > 0
      player3.attacks(player1)
      puts player1.show_state
      end

      if player1.life_points <= 0 
        break
      end
    end
  end
### Here the cows attack



end

if player1.life_points >= 0 && player2.life_points <= 0 && player3.life_points <= 0 
  puts "You're a real cowboy YEEEEHAAAAAA ! "
else
  puts "#{player1.name} has 0 life points remaining."
  puts "you have lost, looooser!"
end


 
binding.pry
puts "fin du game" 

class Game #classe Game
  attr_accessor :human_player, :enemies_start_game #les 2 attr_accessor
  
  my_game = Game.new("Wolverine") #Nouvelle partie
  human_player = HumanPlayer.new("Wolverine")
  @enemies_start_game = [] #Array qui contiendra les ennemis

  player1 = Player.new("Vache 1")
  player2 = Player.new("Vache 2")
  player3 = Player.new("Vache 3")
  player4 = Player.new("Vache 4")
  @enemies_start_game << Player.new

def kill_player(player) #Méthode pour tuer un NPC
  @enemies_start_game.delete(player)
end

def is_still_ongoing? #Méthode pour savoir si le jeu continue
	if human_player.life_points > 0 && @enemies_start_game.length > 0
	  puts "ça joue Bro"
	else 
	  puts "c'est mort morray"
	end
end

def show_players #Méthode qui affiche les points de vie des joueurs 
	@human_player.show_state
	puts "Il reste #{@enemies_start_game.count} bots à abattre"
end

def menu #Méthode qui affiche le menu
	puts "C'est votre tour #{human_player.name}. Que voulez-vous faire ?"
	puts "a - Chercher une meilleure arme"
	puts "s - Chercher un kit de soin pour régénérer ses pv"

	i = 1
  @enemies_start_game.each do |enemy|
    if  enemy.life_points > 0
		puts "#{i} - Attaquer #{enemy.name} (#{enemy.life_points} pv)"
    i += 1
    end
	end

print "> "
	choice = gets.chomp
end

def menu_choice(choice)
  # la fonction case permet de faire fonctionner le menu
  x = @enemies_start_game.length
  case choice
  when 'a'
    player1.search_weapon
  when 's'
    player1.search_health_pack
  for number_of_enemies in (1..x) do
   "#{number_of_enemies}"
      player1.attacks(player"#{number_of_enemies}")
      if player"#{number_of_enemies}".life_points < 1
          kill_player(player"#{number_of_enemies}")
      end
  end
end

def enemies_attack #Méthode qui fait attaquer le HumanPlayer par les NPC
	puts "Les autres joueurs t'attaquent !"
	@ennemies_start_game.each do |ennemy|
		ennemy.attacks(human_player)
		if @human_player.life_points <= 0
			break
		end
	end
end

def fin
  puts "La partie est finie"
  if human_player.life_points > 0
    puts "You're a real cowboy YEEEEHAAAAAA !"
  else
    puts "#{human_player.name} has 0 life points remaining."
    puts "you have lost, looooser!"
	end
end

end

binding.pry 
puts "This is the end"
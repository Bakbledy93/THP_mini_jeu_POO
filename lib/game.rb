class Game
	attr_accessor :human_player, :ennemies_start_game
end


def initialize
	@ennemies_start_game = []
end 

my_game = Game.new("Wolverine")

human_player = HumanPlayer.new("Wolverine")

player1 = Player.new("Vache 1")
player2 = Player.new("Vache 2")
player3 = Player.new("Vache 3")
player4 = Player.new("Vache 4")
@ennemies_start_game << Player.new


	def kill_player
 @ennemies_start_game.delete
end


def is_still_ongoing?
	if human_player.life_points > 0
	puts "ça joue"
	else @ennemies_start_game.empty
	puts "c'est mort"
	end
end

def show_players
	@human_player.show_state
	puts "Il reste #{@ennemies_start_game.count} bots à abattre"
end

def menu
	puts "C'est votre tour #{human_player.name}. Que voulez-vous faire ?"
	puts "a - Chercher une meilleure arme"
	puts "s - Chercher un kit de soin pour régénérer ses pv"

	i = 1
	@ennemies_start_game.each do |enemy|
		puts "#{i} - Attaquer #{enemy.name} (#{enemy.life_points} pv)"
		i += 1
	end

	print "> "
	gets.chomp
end



def menu_choice(choice)
	if choice == 'a'# Allow the user to choose an action to run

	elsif choice.to_i > 0
		choice = choice.to_i
		@human_player.attacks(@ennemies_start_game[choice - 1])
		if ennemies_start_game[choice - 1].life_points <= 0
			kill_player(@ennemies_start_game[choice - 1])
		end
	else
		puts "Vas dormir..."
	end
end


def enemies_attack
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


binding.pry 
puts "This is the end"
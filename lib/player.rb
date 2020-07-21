require 'pry'

class Player
  attr_accessor :name, :life_points
  
  def initialize(player_name)
    @name = player_name.to_s
    @life_points = 10
  end

  def show_state
    puts "#{@name} à #{@life_points} points de vie"
  end

  def gets_damage(damage)
    @life_points = @life_points - damage
  end
	
	def compute_damage
    return rand(1..6)
  end

  def attacks(player)
		puts "#{@name} attaque #{player.name} !"
		damage = compute_damage
    player.gets_damage(damage)
    
		if player.life_points > 0
		puts "#{@name} lui inflige #{damage} points de dommage."
		else 
			puts "Oups, #{player.name} c'est fait décapité..."
    end

  end
    
end 

class	HumanPlayer < Player
	attr_accessor :weapon_level

  def initialize(player_name)
    super(player_name)
    @life_points = 100
    @weapon_level = 1 
  end

  def show_state
    puts "#{@name} à #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    new_weapon_level = rand(1..6)
    puts new_weapon_level

      if  new_weapon_level > @weapon_level 
        @weapon_level = new_weapon_level
        puts "ok tu as trouvé une super vache tueuse de niveau #{new_weapon_level}"
      else
        puts "on la laisse par terre car c'était un petit veau de niveau mouuuuh #{new_weapon_level}"
      end
  end

  def search_health_pack
    dice_health_pack = rand(1..6)
    if dice_health_pack == 1
      puts "Tu n'as rien trouvé malheureux.."
    elsif dice_health_pack >= 2 && dice_health_pack <= 5
      @life_points += 50
      if @life_points > 100
        @life_points = 100
        puts "T'es déjà au max mon gars, laisse un peu aux autres"
      else
        puts "T'as choppé du Redbull qui te redonnes 50 points de vie, tu as #{@life_points} points de vie"
      end
    elsif
      @life_points += 80
      if @life_points > 100
        @life_points = 100
        puts "T'es déjà au max mon gars, laisse un peu aux autres"
      else
        puts "T'as choppé un mega Redbull qui te redonnes 80 points de vie, tu as #{@life_points} points de vie"
      end
    end
  end

end
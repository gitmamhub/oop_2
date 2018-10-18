class Zombie

  @@horde = []
  @@plague_level = 10
  @@max_speed = 5
  @@max_strength = 8
  @@default_speed = 1
  @@default_strength =3

  def initialize(speed, strength)
    if speed > @@max_speed
       @speed = @@default_speed
     else
       @speed = speed
    end

    if strength > @@max_strength
       @strength = @@default_strength
     else
       @strength = strength

    end
  end

  def self.all
    return @@horde
  end

  def self.new_day
    self.some_die_off
    self.spawn
    self.increase_plague_level

    # num = rand(0..2)
    # @@plague_level += num
  end
  def speed
    return @speed
  end
  def strength
      return @strength
  end

  def self.some_die_off
    num = rand(0..10)
    num.times do
      @@horde.pop
    end
  end
  def self.spawn
      no_zombie = rand(1..@@plague_level)
      no_zombie.times do
          new_zombie = Zombie.new(@@max_speed,@@max_strength)
          @@horde << new_zombie
      end
  end

  def self.increase_plague_level

  end



  def encounter
    if self.outrun_zombie? == true
      puts " You escaped !"
      else
        if self.survive_attack? == false
           puts "Being killed by the Zombie  ! "
         else
           puts "Catching the plague and becoming a zombie yourself."
           zombie_reborn = Zombie.new(rand(@@max_speed+1),rand(@@max_strength+1))
           @@horde << zombie_reborn
        end
    end
  end

  def outrun_zombie?
    current_speed  = rand(1..@@max_speed)
      if current_speed > self.speed
        puts "You Escaped !! "
        return true
      else
        return false
      end
  end

  def survive_attack?
    current_strength = rand(1..@@max_strength)
      if current_strength > self.strength
          puts "You are stronger than the Zombie !!"
          return true
        else
          return false
      end
  end
end




puts Zombie.all.inspect # []

# zombie1 = Zombie.new(4,6)

Zombie.new_day

puts Zombie.all.inspect # [#<Zombie:0x005626ecc5ebd0 @speed=4, @strength=0>, #<Zombie:0x005626ecc5eba8 @speed=0, @strength=4>, #<Zombie:0x005626ecc5eb80 @speed=4, @strength=4>]
zombie1 = Zombie.all[0]
zombie2 = Zombie.all[1]
zombie3 = Zombie.all[2]
puts zombie1.encounter # You are now a zombie
puts zombie2.encounter # You died
puts zombie3.encounter # You died
Zombie.new_day
puts Zombie.all.inspect # [#<Zombie:0x005626ecc5e1f8 @speed=0, @strength=0>, #<Zombie:0x005626ecc5e180 @speed=3, @strength=3>, #<Zombie:0x005626ecc5e158 @speed=1, @strength=2>, #<Zombie:0x005626ecc5e090 @speed=0, @strength=4>]
zombie1 = Zombie.all[0]
zombie2 = Zombie.all[1]
zombie3 = Zombie.all[2]
puts zombie1.encounter # You got away
puts zombie2.encounter # You are now a zombie
puts zombie3.encounter # You died

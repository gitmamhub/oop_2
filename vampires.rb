

class Vampire

 @@coven = []



def initialize(name,age)
  @name = name
  @age = age
  @in_coffin = true
  @drank_blood_today = false

end


def self.create (name,age)
  new_vampire = Vampire.new(name,age)
  @@coven << new_vampire

  # puts "total is :#{@@coven.length }"
  return new_vampire

end

def self.sunrise
  @@coven.delete_if do |vampire |
    if vampire.in_coffin == false || vampire.drank_blood_today == false
      true
    end

    # puts "#{vamp.drank_blood_today }"
  end
end

def self.sunset
    @@coven.each do |vampire|
      vampire.in_coffin = false
      vampire.drank_blood_today = false
    end
end

def self.go_home
  @@coven.each do |vampire|
    vampire.in_coffin = true
  end
end


def all
    # puts "#{self.name}, #{self.age},#{self.in_coffin},#{self.drank_blood_today} "

end

def drink_blood
  @drank_blood_today = true
end

def name
return @name
end
def age
return @age
end
def in_coffin
  return @in_coffin
end
def drank_blood_today
  return @drank_blood_today
end



end



# v1 = Vampire.new('bloodhorror',200)
v2 = Vampire.create('bloodrole',250)
v3 = Vampire.create('bloodrolemodel',260)
v4 = Vampire.create('bloody',270)

Vampire.sunrise
v2.drink_blood
puts "v2 : #{v2.drank_blood_today}"
Vampire.go_home

puts "in_coffin all: #{v2.in_coffin}, #{v3.in_coffin},#{v4.in_coffin}"

# Vampire.each do |vampire|
#   puts "#{vampire.in_coffin}"
# end





# puts "1st vampire: #{v1.name}, #{v1.age}, #{v1.in_coffin}, #{v1.drank_blood_today}"
# puts "2nd vampire: #{v2.name}, #{v2.age}, #{v2.in_coffin}, #{v2.drank_blood_today}"

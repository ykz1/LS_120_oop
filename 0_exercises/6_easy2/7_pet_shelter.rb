class Pet
  attr_reader :breed, :name
  @@unadopted_pets = []
  def self.unadopted_pets
    @@unadopted_pets
  end
  def self.adopt(pet)
    @@unadopted_pets.delete(pet)
  end
  def initialize(breed, name)
    @breed = breed
    @name = name
    @@unadopted_pets << self
  end
end

class Owner
  attr_reader :pets, :name
  def initialize(name)
    @name = name
    @pets = []
  end
  def number_of_pets
    pets.count
  end
end

class Shelter
  def initialize(name = 'The Animal Shelter')
    @name = name
    @owners = []
  end
  def adopt(owner, pet)
    owner.pets << pet
    @owners << owner unless @owners.include?(owner)
    Pet.adopt(pet)
  end
  def print_adoptions
    @owners.each do |owner|
      puts "#{owner.name} has adopted the following pets:"
      owner.pets.each do |pet|
        puts "a #{pet.breed} named #{pet.name}"
      end
      puts
    end
    unless Pet.unadopted_pets.empty?
      puts "#{@name} has the following unadopted pets:"
      Pet.unadopted_pets.each do |pet|
        puts "a #{pet.breed} named #{pet.name}"
      end
      puts
    end
  end
end



butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')
asta         = Pet.new('dog', 'Asta')
laddie       = Pet.new('dog', 'Laddie')
fluffy       = Pet.new('cat', 'Fluffy')
kat          = Pet.new('cat', 'Kat')
ben          = Pet.new('cat', 'Ben')
chatterbox   = Pet.new('parakeet', 'Chatterbox')
bluebell     = Pet.new('parakeet', 'Bluebell')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new('The Animal Shelter')
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."

# P Hanson has adopted the following pets:
# a cat named Butterscotch
# a cat named Pudding
# a bearded dragon named Darwin

# B Holmes has adopted the following pets:
# a dog named Molly
# a parakeet named Sweetie Pie
# a dog named Kennedy
# a fish named Chester

# P Hanson has 3 adopted pets.
# B Holmes has 4 adopted pets.
class Owner 
  attr_accessor :mood, :cat, :dog, :pets, :cat_name, :owner
  attr_reader :species, :name
  @@all = []
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end
  
  def say_species
    return "I am a #{@species}."
  end
  
  def self.all 
    @@all 
  end
  
  def self.count 
    return @@all.count
  end
  
  def self.reset_all
    @@all.clear
  end
  
  def cats 
    Cat.all.select {|cat| cat.owner == self}
  end
  
  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end
  
  def buy_cat(name)
    Cat.new(name, self)
  end
  
  def buy_dog(name)
    Dog.new(name, self)
  end
  
  def walk_dogs
    self.dogs.collect.each do |dog|
      dog.mood = "happy"
    end
  end
  
  def feed_cats
    self.cats.collect.each do |cat|
      cat.mood = "happy"
    end
  end
  
  def sell_pets
    @pets = self.dogs + self.cats
    pets.collect do |pet|
        pet.mood = "nervous"
        pet.owner = nil
      end
  end
  
  def list_pets
    self.dogs.size
    
    return "I have #{@owner.dogs.count} dog(s), and #{@owner.cats.count} cat(s)."
  end
  #"I have #{@owner.dogs.count} dog(s), and #{@owner.cats.count} cat(s)."
end
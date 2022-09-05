class Owner
  attr_reader :name, :species
  @@all = Array.new
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.size
  end

  def self.reset_all
    @@all = Array.new
  end

  def cats
    Cat.all.select{ |cat| cat.owner == self}
  end

  def dogs
    Dog.all.select{ |dog| dog.owner == self}
  end

  def buy_cat(cat)
    new_cat = Cat.new(cat, self)
  end

  def buy_dog(dog)
    new_dog = Dog.new(dog, self)
  end

  def walk_dogs
    dogs.each do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    cats.each do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    dogs.each do |dog|
      dog.owner = nil
      dog.mood = "nervous"
    end
    cats.each do |cat| 
      cat.owner = nil
      cat.mood = "nervous"
    end
  end

  def list_pets
    "I have #{self.dogs.size} dog(s), and #{self.cats.size} cat(s)."
  end

end
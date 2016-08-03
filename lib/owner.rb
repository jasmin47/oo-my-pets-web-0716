class Owner
@@all = []
@@count = 0

  attr_reader :species
  attr_accessor :name, :pets

  def initialize(name, species = "human")
    @name = name
    @species = species
    @pets = {:fishes => [], :dogs => [], :cats => []}

    @@all << self
    @@count += 1
  end

  def say_species
    "I am a #{@species}."
  end


  def buy_fish(fish)
    new_fish = Fish.new(fish)
    @pets[:fishes] << new_fish
  end


  def buy_cat(cat)
    new_cat = Cat.new(cat)
    @pets[:cats] << new_cat
  end

  def buy_dog(dog)
    new_dog = Dog.new(dog)
    @pets[:dogs] << new_dog
  end

  def walk_dogs
    @pets[:dogs][-1].mood = "happy"
  end

  def play_with_cats
    @pets[:cats][-1].mood = "happy"
  end

  def feed_fish
    @pets[:fishes][-1].mood = "happy"
  end

  def sell_pets
    @pets.each{|pet_type, pets|
      pets.each {|pet|
        pet.mood = "nervous"}}
    @pets.each{|pet_type, pets|
      pets.clear}
  end

  def list_pets
    fish_num = @pets[:fishes].length
    dog_num = @pets[:dogs].length
    cat_num = @pets[:cats].length
    "I have #{fish_num} fish, #{dog_num} dog(s), and #{cat_num} cat(s)."

  end

  def self.all
    @@all
  end

  def self.count
    @@count
  end

  def self.reset_all
    self.all.clear
    @@count = 0
  end
end

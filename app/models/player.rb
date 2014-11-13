class Player < ActiveRecord::Base
  validates :name, :presence => true
  validates :name, :uniqueness => true

  has_one :game
  has_one :rival, through: :game
  has_and_belongs_to_many :pokemon

  after_save :reroll
  after_create :reroll

  def list_pokemon
    pokemon_id_arr = []
    pokemon_arr = []
    Our.all.each do |our|
      if our.player_id == self.id
        pokemon_id_arr << our.pokemon_id
      end
    end
    pokemon_id_arr.each do |pokemon_id|
      pokemon_arr << Pokemon.find(pokemon_id)
    end
    pokemon_arr
  end

  def reroll
    release_pokemon
    get_pokemon
  end

  def release_pokemon
    Our.all.each do |our|
      if our.player_id == self.id
        our.destroy
      end
    end
  end

  def get_pokemon
    6.times do
      random_id = 1 + rand(151)
      Our.create(player_id: self.id, pokemon_id: random_id)
    end
  end
end

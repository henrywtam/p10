class Rival < ActiveRecord::Base
  validates :name, :presence => true

  has_one :game
  has_one :player, through: :game
  has_and_belongs_to_many :pokemons

  after_save :reroll
  after_create :reroll

  def list_pokemon
    pokemon_id_arr = []
    pokemon_arr = []
    Their.all.each do |their|
      if their.rival_id == self.id
        pokemon_id_arr << their.pokemon_id
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
    Their.all.each do |their|
      if their.rival_id == self.id
        their.destroy
      end
    end
  end

  def get_pokemon
    6.times do
      random_id = 1 + rand(151)
      Their.create(rival_id: self.id, pokemon_id: random_id)
    end
  end

end

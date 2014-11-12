class Rival < ActiveRecord::Base
  validates :name, :presence => true

  has_one :game
  has_one :player, through: :game
  has_and_belongs_to_many :pokemons

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

end

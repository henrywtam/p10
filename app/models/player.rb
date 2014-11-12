class Player < ActiveRecord::Base
  validates :name, :presence => true
  validates :name, :uniqueness => true

  has_one :game
  has_one :rival, through: :game
  has_and_belongs_to_many :pokemon

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

end

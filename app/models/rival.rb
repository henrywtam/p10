class Rival < ActiveRecord::Base
  validates :name, :presence => true

  has_one :game
  has_one :player, through: :game
  has_and_belongs_to_many :pokemons

  def self.pokemon
    pokemon_ids = Our.where(rival_id: self.id).pokemon_id
    pokemon_ids.each do |pokemon_id|
      puts Pokemon.find(pokemon_id)
    end
  end

end
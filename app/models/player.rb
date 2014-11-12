class Player < ActiveRecord::Base
  validates :name, :presence => true
  validates :name, :uniqueness => true

  has_one :game
  has_one :rival, through: :game
  has_and_belongs_to_many :pokemon

  def self.pokemon
    pokemon_ids = Our.where(player_id: self.id).pokemon_id
    pokemon_ids.each do |pokemon_id|
      puts Pokemon.find(pokemon_id)
    end
  end

end
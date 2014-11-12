class Our < ActiveRecord::Base
  belongs_to :player
  belongs_to :pokemon

  def self.our
    Our.where(player_id: self.player_id, pokemon_id: self.pokemon_id)
  end

end
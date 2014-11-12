class Pokemon < ActiveRecord::Base
  has_and_belongs_to_many :players
  has_and_belongs_to_many :rivals

  def list_players
    player_ids = Our.where(pokemon_id: self.id).player_id
    player_ids.each do |player_id|
      puts Player.find(player_id)
    end
  end

  def list_rivals
    rival_ids = Our.where(pokemon_id: self.id).rival_id
    rival_ids.each do |rival_id|
      puts rival.find(rival_id)
    end
  end

end

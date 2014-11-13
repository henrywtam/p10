helpers do

  def current_user
    begin
      @player = Player.find(session[:player_id])
    rescue
      return nil
    end
  end

end
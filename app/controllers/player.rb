get '/players' do
  @players = Player.all
  erb :players
end

get '/players/:id' do
  @player = Player.find(params[:id])
  @pokemon = @player.list_pokemon
  @rival_pokemon = @player.rival.list_pokemon
  erb :player_profile
end

get '/logout' do
  session[:player_id] = nil
  redirect '/login'
end
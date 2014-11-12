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

get '/players/:id/game' do
end

get '/players/:id/profile' do
  erb :profile
end

get '/players/:id/edit' do
  erb :profile
end

post '/players/:id/edit' do
end

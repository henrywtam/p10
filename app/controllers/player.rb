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

get '/players/:id/reroll' do
  player = Player.find(params[:id])
  player.reroll
  new_pokemon = player.list_pokemon
  if request.xhr?
    content_type :json
    new_pokemon.to_json
  else
    redirect '/'
  end
end

get '/pokemon' do
  @pokemons = Pokemon.all
  erb :pokemon
end

get '/pokemon/:id' do
  @pokemon = Pokemon.find(params[:id])
  if request.xhr?
    content_type :json
    @pokemon.to_json
  else
    erb :pokemon_profile
  end
end
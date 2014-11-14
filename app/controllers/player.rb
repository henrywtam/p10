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

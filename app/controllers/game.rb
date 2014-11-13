get '/' do
  erb :home
end

get '/login' do
  erb :login
end

post '/login' do
end

get '/signup' do
  erb :signup
end

post '/signup' do
  p params
  new_player = Player.new(name: params[:player_name], password: params[:password])
  new_rival = Rival.new(name: params[:rival_name])
  if new_player.save && new_rival.save
    Game.create(player_id: new_player.id, rival_id: new_rival.id)
    redirect "/players/#{new_player.id}"
  else
    redirect '/signup/error'
  end
end

get '/signup/error' do
  puts "there was an error"
end

get '/pokemon' do
  @pokemons = Pokemon.all
  erb :pokemon
end

get '/pokemon/:id' do
  @pokemon = Pokemon.find(params[:id])
  erb :pokemon_profile
end
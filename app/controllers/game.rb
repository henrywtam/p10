get '/' do
  erb :home
end

get '/login' do
  erb :login
end

post '/login' do
  p params
  player = Player.find_by(name: params[:player_name])
  if player.nil?
    @error = "That user does not exist."
    erb :login
  elsif player.password == params[:player_password]
    session[:player_id] = player.id
    redirect "/players/#{player.id}"
  else
    @error = "You entered the wrong password."
    erb :login
  end
end

get '/signup' do
  erb :signup
end

post '/signup' do
  new_player = Player.new(name: params[:player_name], password: params[:password])
  new_rival = Rival.new(name: params[:rival_name])
  if (new_player.save && new_rival.save)
    Game.create(player_id: new_player.id, rival_id: new_rival.id)
    session[:player_id] = player.id
    redirect "/players/#{new_player.id}"
  else
    @error = "There was an issue with the signup. Please try again."
    redirect '/signup'
  end
end

get '/signup/error' do
  erb :signup_error
end

get '/pokemon' do
  @pokemons = Pokemon.all
  erb :pokemon
end

get '/pokemon/:id' do
  @pokemon = Pokemon.find(params[:id])
  erb :pokemon_profile
end
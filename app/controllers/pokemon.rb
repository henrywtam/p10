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
  Player.new(name: params[:player_name])
  Rival.new(name: params[:rival_name])
end

get '/pokemon' do
  @pokemons = Pokemon.all
  erb :pokemon
end

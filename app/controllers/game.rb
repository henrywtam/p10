get '/players' do
  @players = Player.all
  erb :players
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
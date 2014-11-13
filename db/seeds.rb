# require 'httparty'

# counter = 1
# 151.times do
#   url = "http://pokeapi.co/api/v1/pokemon/#{counter}/"
#   response = HTTParty.get(url)
#   Pokemon.create( name:     response["name"],
#                   pkdx_id:  response["pkdx_id"],
#                   height:   response["height"],
#                   weight:   response["weight"],
#                   attack:   response["attack"],
#                   defense:  response["defense"],
#                   speed:    response["speed"],
#                   hp:       response["hp"])
#   counter += 1
# end

Player.create(name: "henry", password: "henry")
Player.create(name: "youngsun", password: "youngsun")
Player.create(name: "shirley", password: "shirley")
Rival.create(name: "ryan")
Rival.create(name: "kevin")
Rival.create(name: "sam")
Game.create(player_id: 1, rival_id: 1)
Game.create(player_id: 2, rival_id: 2)
Game.create(player_id: 3, rival_id: 3)

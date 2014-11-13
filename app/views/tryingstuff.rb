url = "http://pokeapi.co/api/v1/pokemon/4/"
require 'httparty'
require 'nokogiri'
require 'pp'

# response = HTTParty.get(url)


# p response["name"]
# p response["pkdx_id"]
# p response["speed"]
# p response["weight"]
# p response["types"][0]["name"]
# p response["hp"]
# p response["height"]
# p response["defense"]
# p response["attack"]

# Pokemon.create(name: "anything")

# 5.times do
  counter = 1
  url = "http://pokeapi.co/api/v1/pokemon/#{counter}/"
  response = HTTParty.get(url)
  name = response["name"]
  p name
  p name.class
  Pokemon.create()
  p "success"
#   counter += 1
# end
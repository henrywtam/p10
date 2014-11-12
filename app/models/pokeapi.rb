module PokeApi

  class Pokemon
    include HTTParty

    def pokemon
      response = self.class.get('http://pokeapi.co/api/v1/pokemon/1/')
      parsed_resp = JSON.parse(response.body)
      p parsed_resp
    end
  end
end


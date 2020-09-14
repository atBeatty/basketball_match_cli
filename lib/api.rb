# puts "Hello"

require_relative './team.rb'


class API

    def self.get_player_by_id(id)
        url = "https://www.balldontlie.io/api/v1/players/#{id}"
        uri = URI.parse(url)
        response = Net::HTTP.get_response(uri)
        response.body
        json_response = JSON.parse(response.body) #data hash

        return json_response #THIS DIDNT WORK WITHOUT THE RETURN
    end
   

    def self.get_squad
        # binding.pry
        url = "https://www.balldontlie.io/api/v1/season_averages?season=2018&player_ids[]=#{rand(300)}&player_ids[]=#{rand(400)}&player_ids[]=#{rand(400)}&player_ids[]=#{rand(400)}&player_ids[]=#{rand(400)}"
        uri = URI.parse(url)
        response = Net::HTTP.get_response(uri)
        json_response = JSON.parse(response.body) #data hash
        
        return json_response["data"] #THIS DIDNT WORK WITHOUT THE RETURNq
    end

end



require_relative './api.rb'


class Roster

    attr_accessor :team, :team_stats, :team_list


    def initialize
        @team = API.get_squad
    end

    def team_stats
        @team_stats = []
        self.team.each do |player|
            @team_stats << "#{player["player_id"]} #{player["pts"]}"
        end
        puts @team_stats
    end

    def team_list
        @team_list = []
        self.team.each do |player_id|
            player_card = API.get_player_by_id(player_id["player_id"])
            binding.pry
            @team_list << "#{player_card["first_name"]} #{player_card["last_name"]} - #{player_card["position"]} - #{player_card["team"]}"

        end

        puts @team_list
    end





end
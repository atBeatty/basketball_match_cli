

require_relative './api.rb'


class Team

    attr_accessor :team, :team_stats, :team_list
    @@all = []

    def initialize
        @team = API.get_squad
        @team_stats = []
        @@all << self
    end

    def self.all
        @@all
    end

    def team_stats

        self.team.each_with_index do |player, index|
            player_name = self.team_list[index].split("-").first.chomp
            @team_stats << "#{player_name} #{(player["pts"].to_i)}"
        end

    @team_stats
    end


    def team_list
        @team_list = []
        self.team.each do |player_id|
            
            player_card = API.get_player_by_id(player_id["player_id"])
            @team_list << "#{player_card["first_name"]} #{player_card["last_name"]} #{player_card["position"]} - #{player_card["team"]["full_name"]}"

        end
    @team_list
    end





end
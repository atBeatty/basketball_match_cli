

require_relative './api.rb'


class Team

    attr_accessor :team, :team_stats, :team_list
    @@all = []

    def initialize
        @team = API.get_squad
        @team_stats = []
        @team_list = []
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


    def team_list_of_names
        @team_list = @team.collect {|player_id| API.get_player_by_id(player_id["player_id"])}
        @team_list.collect do |player| 
            player["first_name"] + " " + player["last_name"] + " " + player["position"]
        end

    end





end
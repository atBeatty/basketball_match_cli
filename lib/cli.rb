
require_relative './api.rb'
require_relative './team.rb'


class CLI


    def self.run
        puts "Welcome to the court"
        @user_team_1 = Team.new
        @user_team_2 = Team.new
        @opp_team = Team.new
        puts "Please select one of the following teams to run the court with tonight against the opponents."
    end


    def self.display_teams
        # binding.pry
        puts "\n\nOption 1\n\n"
        puts @user_team_1.team_list
        
        puts "\n\nOption 2\n\n"
        puts @user_team_2.team_list

        #GET INPUT FROM USER TO DECIDE TEAM  //
        puts "\n\nSo, who is your squad?"
        input = gets.chomp
        if input != "1" && input != "2"
            puts "\n\nPlease try choosing again."
            input = gets.chomp
        elsif input == "1"
            @chosen_team = @user_team_1
        else
            @chosen_team = @user_team_2
        end


    @chosen_team
    end

    def self.display_opponent

        puts "\n\nYour opponent in tonight's game is:\n\n"
        puts @opp_team.team_list
    end



    #GAME BEHAVIOR
    def self.display_game_score
        message_array = ["END OF FIRST QUARTER", "END OF FIRST HALF", "END OF THIRD QUARTER", "END OF GAME"]
        #SUM UP ALL AVG POINT STATS FROM TEAM PLAYERS
        puts "\n\nTIP OFF!"
        chosen_team_total = 0
        opp_total = 0

        message_array.each do |message|
            sleep(3)
            @opp_team.team.each do |pl|
            opp_total += pl["pts"]
            end

            @chosen_team.team.each do |pl|
            chosen_team_total += pl["pts"] + rand(-5..5)

            end

            sleep(2)
            puts "\nyour team: #{chosen_team_total.to_int}\n\n"
            puts "opponents team: #{opp_total.to_int}\n\n"
            puts message

        end
    end

    def self.game_breakdown

        puts "Here is the game's breakdown by player.\n\n"
        puts @chosen_team.team_stats

        puts "****************\n\n"
        puts @opp_team.team_stats
        


    end



    



    # methods that use Roster to display roster.attrs 






    def self.play_basketball
       
            puts "                                  (( )"
            sleep(0.5)
            puts "                         (( )"
            sleep(0.5)

            puts "                 (( )"
            sleep(0.5)
            puts "          (( )"
            sleep(0.5)
            puts "  (( )"
            sleep(0.5)
            puts "|| (( )"
            sleep(0.5)
            puts "||__(( )___"

            puts "      (( )"

    end


end
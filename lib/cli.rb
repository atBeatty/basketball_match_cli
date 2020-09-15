
require_relative './api.rb'
require_relative './team.rb'


class CLI
    def self.call
        self.run
        self.display_teams
        self.display_opponent
        sleep(4)
        # self.play_basketball
        self.display_game_score
    end


    def self.run
        puts "\n\nWelcome to the court\n\n"
        @user_team_1 = Team.new
        @user_team_2 = Team.new
        @opp_team = Team.new
        puts "Please select one of the following teams to run the court with tonight against the opponents."
    end


    def self.display_teams
        puts "\n\nOption 1\n\n" 
        puts @user_team_1.team_list_of_names
        puts "\n\nOption 2\n\n" 
        puts @user_team_2.team_list_of_names

        #GET INPUT FROM USER TO DECIDE TEAM  
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
        puts @opp_team.team_list_of_names


    end



    #GAME BEHAVIOR
    def self.display_game_score
        chosen_team_total = 0
        opp_total = 0
        message_array = ["END OF FIRST QUARTER", 
            "END OF FIRST HALF", 
            "END OF THIRD QUARTER", 
            "END OF GAME"]
        
        
        puts "\n\nTIP OFF!"
        message_array.each do |message|
            sleep(3)
            counter = 0
            
            while counter < 5
                opp_total += @opp_team.team[counter]["pts"]*rand
                
                chosen_team_total += @chosen_team.team[counter]["pts"]*rand
                counter +=1
            end
            puts "\n\nPLAYERS ON THE COURT\n\n"
            #CURRENT SQUAD ON THE COURT
            puts @chosen_team.team_list_of_names.first(5)
            sleep(2)
            @opp_team.team.shuffle!
            @chosen_team.team.shuffle!

            sleep(2)

            puts "\n#{message}"
            puts "\nOPPONENTS SCORE: #{opp_total.to_i} to YOUR SCORE: #{chosen_team_total.to_i}"


        end
    end


    def self.game_breakdown

    end

end
class NflStandings::CLI

  def call
    menu
    list_nfl_conferences
    goodbye
  end

  def menu
    puts ""
    puts "The NFL Standings as of today are:"
    puts ""
    puts "1. All NFL Team Standings"
    puts "2. American Football Conference Standings (AFC)"
    puts "3. National Football Conference Standings (NFC)"
  end


  def list_nfl_conferences
    input = nil
    while input != "exit"
      puts ""
      puts "Click the appropriate menu number to view the standings, type menu to go back to the menu or type exit"
      puts ""
      input = gets.strip.downcase

      if input.to_i == 1
        @all_nfl_teams = NflStandings::Standing.all_nfl_teams_standings
      elsif input.to_i == 2
        @all_afc_teams = NflStandings::Standing.all_afc_teams_standings
      elsif input.to_i == 3
        @all_nfc_teams = NflStandings::Standing.all_nfc_teams_standings
      elsif input == "menu"
        menu
      elsif
        puts ""
        puts "That's not an option. Type menu to return to the menu or type exit."
      end
    end
  end

  def goodbye
    puts ""
    puts "Check back tomorrow for the latest updates!"
  end

end

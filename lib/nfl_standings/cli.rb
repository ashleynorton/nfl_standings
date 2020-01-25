class NflStandings::CLI

  def call
    NflStandings::Scraper.get_all
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
        get_standings(NflStandings::Standing.all)
      elsif input.to_i == 2
        get_standings(NflStandings::Standing.get_afc)
      elsif input.to_i == 3
        get_standings(NflStandings::Standing.get_nfc)
      elsif input == "menu"
        menu
      elsif
        puts ""
        puts "That's not an option. Type menu to return to the menu or type exit."
      end
    end
  end

  def get_standings(teams)
    teams.each do |standing|
      print_standings(standing)
    end
  end

  def print_standings(standing)
    puts ""
    puts ""
    puts "Team:   #{standing.team}"
    puts ""
    puts "Wins:   #{standing.wins}"
    puts ""
    puts "Losses: #{standing.losses}"
    puts ""
    puts "Ties:   #{standing.ties}"
    puts ""
  end

  def goodbye
    puts ""
    puts "Check back tomorrow for the latest updates!"
  end



end

class NflStandings::CLI

  def call
    list_conferences
    menu
    goodbye
  end

  def list_conferences
    puts ""
    puts "The NFL Standings as of today are:"
    #Display 2 options for NFL conferences
    puts "\n    1. All NFL Team Standings\n\n    2. American Football Conference (AFC)\n
    3. National Football Conference (NFC)"
  end


  def menu
    input = nil
    while input != "exit"
      puts ""
      puts "Click the appropriate menu number to view the standings, type list to go back to the menu, or type exit\n\n"
      input = gets.strip.downcase



      case input
      when "1"
        print_all_standings
      when "2"
        print_afc_standings
      when "3"
        print_nfc_standings
      when "list"
        list_conferences
      else
        puts "\nThat's not an option. Type list to return to the menu or type exit."
      end
    end
  end

  def goodbye
    puts "\nCheck back tomorrow for the latest updates!"
  end


  def print_all_standings
    puts ""
    puts "---------- All NFL Team Standings ----------"
    puts ""

    NflStandings::Standing.all_teams.each_with_index { |standing, index|
      puts "#{index}. #{standing.team_name} -- Wins: #{standing.wins} Losses: #{standing.losses} Ties: #{standing.ties}} "
    }
  end

  def print_afc_standings
    puts ""
    puts "---------- AFC Standings ----------"
    puts ""

    NflStandings::Standing.all_afc_teams.each_with_index { |standing, index|
      puts "#{index}. #{standing.team_name} -- Wins: #{standing.wins} Losses: #{standing.losses} Ties: #{standing.ties}} "
    }
  end

  def print_nfc_standings
    puts ""
    puts "---------- NFC Standings ----------"
    puts ""

    NflStandings::Standing.all_nfc_teams.each_with_index { |standing, index|
      puts "#{index}. #{standing.team_name} -- Wins: #{standing.wins} Losses: #{standing.losses} Ties: #{standing.ties}} "
    }
  end



end

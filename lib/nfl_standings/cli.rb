class NflStandings::CLI

  def call
    list_conferences
    menu
    goodbye
  end

  def list_conferences
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
        puts "\n    1. Atlanta Falcons -- Wins: 1 Losses: 3 Ties: 0\n    2. Houston Texans -- Wins: 1 Losses: 3 Ties: 0\n    3. Miami Dolphins -- Wins: 3 Losses: 1 Ties: 0\n    4. Seattle Seahawks -- Wins: 3 Losses: 1 Ties: 0"
      when "2"
        puts "\nAFC Standings:\n1. Houston Texans -- Wins: 1 Losses: 3 Ties: 0\n2. Miami Dolphins -- Wins: 3 Losses: 1 Ties: 0"
      when "3"
        puts "\nNFC Standings:\n1. Atlanta Falcons -- Wins: 1 Losses: 3 Ties: 0\n2. Seattle Seahawks -- Wins: 3 Losses: 1 Ties: 0"
      when "list"
        puts "\n"
        list_conferences
      else
        puts "\nThat's not an option. Type list to return to the menu or type exit."
      end
    end
  end

  def goodbye
    puts "\nCheck back tomorrow for the latest updates!"
  end

  def print_standings
    puts
  end

  def print_all_standings
    puts ""
    puts "---------- All NFL Team Standings ----------"
    puts ""
  end

  def print_afc_standings
    puts ""
    puts "---------- AFC Standings ----------"
    puts ""
  end

  def print_nfc_standings
    puts ""
    puts "---------- NFC Standings ----------"
    puts ""
  end



end

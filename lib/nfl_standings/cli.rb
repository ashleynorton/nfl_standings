class NflStandings::CLI 
  
  def call
    list_conferences
    menu
    goodbye
  end 
  
  def list_conferences
    puts "The NFL Standings as of today are:"
    #Display 2 options for NFL conferences 
    puts "\n    1. American Football Conference (AFC)\n
    2. National Football Conference (NFC)"
  end 
  
  
  def menu
    input = nil 
    while input != "exit"
      puts "\nClick the appropriate number to view the conference standings, type list to pick a different conference again, or type exit\n\n"
      input = gets.strip.downcase
      case input
      when "1"
        puts "\nAFC Standings:\n1. Houston Texans -- Wins: 1 Losses: 3 Ties: 0\n2. Miami Dolphins -- Wins: 3 Losses: 1 Ties: 0"
      when "2"
        puts "\nNFC Standings:\n1. Atlanta Falcons -- Wins: 1 Losses: 3 Ties: 0\n2. Seattle Seahawks -- Wins: 3 Losses: 1 Ties: 0"
      when "list"
        list_conferences
      end
    end 
  end 
  
  def goodbye
    puts "\nCheck back tomorrow for the latest updates!"
  end 
end 
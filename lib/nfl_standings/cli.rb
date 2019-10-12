class NflStandings::CLI 
  
  def call
    puts "The NFL Standings as of today are:"
    list_conferences
    menu
  end 
  
  def list_conferences
    #Display 2 options for NFL conferences 
    puts "\n    1. American Football Conference (AFC)\n
    2. National Football Conference (NFC)"
  end 
  
  
  def menu 
    puts "\nClick the appropriate number to view the conference standings"
  end 
  
end 
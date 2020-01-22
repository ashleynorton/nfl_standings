class NflStandings::Standing


  def self.all_nfl_teams_standings
    puts ""
    puts "---------- All NFL Team Standings ----------"
    puts ""

    NflStandings::Scraper.all

  end

  def self.all_afc_teams_standings
    puts ""
    puts "---------- AFC Standings ----------"
    puts ""

    NflStandings::Scraper.afc

  end

  def self.all_nfc_teams_standings
    puts ""
    puts "---------- NFC Standings ----------"
    puts ""

    NflStandings::Scraper.nfc

  end


end

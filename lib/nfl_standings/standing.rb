class NflStandings::Standing

  attr_accessor :team_name, :wins, :losses, :ties

  def self.all_nfl_teams_standings
    #Scrape espn/nfl/standings and then return standings based on that data
    puts ""
    puts "---------- All NFL Team Standings ----------"
    puts ""

    self.scrape_all_standings
  end

  def self.all_afc_teams_standings
    ##I should return all afc teams stats
    puts ""
    puts "---------- AFC Standings ----------"
    puts ""

    self.scrape_all_standings
  end

  def self.all_nfc_teams_standings
    #I should return all nfc teams stats
    puts ""
    puts "---------- NFC Standings ----------"
    puts ""

    self.scrape_all_standings
  end

  def self.scrape_espn
    doc = Nokogiri::HTML(open("https://www.espn.com/nfl/standings"))

    standing = self.new
    standing.team_name = #doc.css(".ResponsiveTable").css(".hide-mobile").text
    doc.css(".ResponsiveTable").css(".hide-mobile").css("a").first.text
    #standing.team_name.each {|n| @@standings << n.text.strip}
    standing.wins = doc.css(".Table__TD").css(".stat-cell")[0].text
    standing.losses = doc.css(".Table__TD").css(".stat-cell")[1].text
    standing.ties = doc.css(".Table__TD").css(".stat-cell")[2].text

    standing
  end

  def self.scrape_all_standings
    @@standings = []

    @@standings << self.scrape_espn

    @@standings
  end



  def self.scrape_afc_standings

  end

  def self.scrape_nfc_standings

  end
end

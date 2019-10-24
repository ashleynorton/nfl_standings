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
    @@doc = Nokogiri::HTML(open("https://www.espn.com/nfl/standings"))

    standing = self.new
    self.team_names
    #doc.css(".ResponsiveTable").css(".hide-mobile").text
    #doc.css(".ResponsiveTable").css(".hide-mobile").css("a").first.text
    #doc.css(".ResponsiveTable").css(".hide-mobile").css("a").map do |anchor| anchor.text end
    #standing.team_name.each do |team|
      #puts "#{team}"
    #end
    #standing.team_name.each {|n| @@standings << n.text.strip}
    #binding.pry
    standing.wins = @@doc.css(".Table__TD").css(".stat-cell")[0].text
    standing.losses = @@doc.css(".Table__TD").css(".stat-cell")[1].text
    standing.ties = @@doc.css(".Table__TD").css(".stat-cell")[2].text

    standing
  end

  def self.team_names
    @team_name = @@doc.css(".ResponsiveTable").css(".hide-mobile").css("a").map do |anchor| anchor.text end
    @team_name.each.with_index(1) do |team, index|
      puts "#{index}. #{team} -- Wins: 0 Losses: 0 Ties: 0 "
    end
    @team_name
  end

  def self.scores
    @wins =
    @losses =
    @ties = 
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

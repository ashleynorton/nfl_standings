#class NflStandings::Standing
#
#  attr_accessor :team_name
###
###  def self.scrape_espn
###    @@doc = Nokogiri::HTML(open("https://www.espn.com/nfl/standings"))
###    self.cli
###  end
###
###  def self.cli
###    @team_name = @@doc.css(".ResponsiveTable").css(".hide-mobile").css("a").map do |anchor| anchor.text end
###
###    @scores = @@doc.css("table:not(.Table--fixed-left)").css(".Table__TR").css("tr:not(.Table__sub-header)").map do |td| td.text end
###
###    @team_name.zip @scores do |items|
###      team = items[0]
###      wins = items[1][0]
###      losses = items[1][1]
###      ties = items[1][2]
###      puts "#{team} --- Wins: #{wins} Losses: #{losses} Ties: #{ties}"
###    end
###  end
###
###
###  def self.all_nfl_teams_standings
###    #Scrape espn/nfl/standings and then return standings based on that data
###    puts ""
###    puts "---------- All NFL Team Standings ----------"
###    puts ""
###
###    @@all_standings = []
###
##    @@all_standings << self.scrape_espn
##
##    @@all_standings
##  end
##
##  def self.all_afc_teams_standings
##    ##I should return all afc teams stats
##    puts ""
##    puts "---------- AFC Standings ----------"
##    puts ""
##
##    self.scrape_espn[0]
##  end
#
#  def self.all_nfc_teams_standings
#    #I should return all nfc teams stats
#    puts ""
#    puts "---------- NFC Standings ----------"
#    puts ""
#
#    @@all_standings
#
#  end
#
#
#end

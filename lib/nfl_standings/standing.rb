class NflStandings::Standing

  attr_accessor :team, :wins, :losses, :ties, :conference

  @@all = []

  def initialize(team, wins, losses, ties, conference)
  
    @team = team
    @wins = wins
    @losses = losses
    @ties = ties
    @conference = conference

    @@all << self
  end

  def self.all
    @@all
  end

  # def self.all_nfl_teams_standings
  #   puts ""
  #   puts "---------- All NFL Team Standings ----------"
  #   puts ""
  #
  #   NflStandings::Scraper.all
  #
  # end
  #
  # def self.all_afc_teams_standings
  #   puts ""
  #   puts "---------- AFC Standings ----------"
  #   puts ""
  #
  #   NflStandings::Scraper.afc
  #
  # end
  #
  # def self.all_nfc_teams_standings
  #   puts ""
  #   puts "---------- NFC Standings ----------"
  #   puts ""
  #
  #   NflStandings::Scraper.nfc
  #
  # end


end

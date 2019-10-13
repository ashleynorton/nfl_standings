require 'nokogiri'
require 'open-uri'

class NflStandings::Standing

  attr_accessor :team_name, :wins, :losses, :ties

  @@all_teams = []
  #@@all_afc_teams = []
  #@@all_nfc_teams = []

  #See if there's a way to break the @@all array in half to put the first half into the AFC and the second half into the NFC

  def self.new_from_index_page(standing)
    self.new(
      standing.css(".ResponsiveTable").css(".hide-mobile").css("a").text,
      standing.css(".Table__TD").css(".stat-cell")[0].text,
      standing.css(".Table__TD").css(".stat-cell")[1].text,
      standing.css(".Table__TD").css(".stat-cell")[2].text
    )
  end 

  def initialize(team_name=nil, wins=nil, losses=nil, ties=nil)
    @team_name = team_name
    @wins = wins
    @losses = losses
    @ties = ties
    @@all_teams << self
  end

  def self.all_teams
    @@all_teams
  end

end

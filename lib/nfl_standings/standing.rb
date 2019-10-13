require_relative './lib/nfl_standings.rb'

class Standing
  attr_accessors :team_name, :wins, :losses, :ties

  @@all_teams = []
  @@all_afc_teams = []
  @@all_nfc_teams = []

  #See if there's a way to break the @@all array in half to put the first half into the AFC and the second half into the NFC

  def initialize
    @@all_teams << self
  end

  def self.all_teams
    @@all_teams
  end

  def team_name
    @team_name = doc.css(".ResponsiveTable").css(".hide-mobile").css("a").text
  end

  def wins
    @wins = doc.css(".Table__TD").css(".stat-cell")[0].text
  end

  def losses
    @losses = doc.css(".Table__TD").css(".stat-cell")[1].text
  end

  def ties
    @ties = doc.css(".Table__TD").css(".stat-cell")[2].text
  end
end

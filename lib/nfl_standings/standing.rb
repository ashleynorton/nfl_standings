class NflStandings::Standing

  attr_accessor :team_name, :wins, :losses, :ties

  def self.all_nfl_teams_standings
    #I should return all nfl teams stats
    puts ""
    puts "---------- All NFL Team Standings ----------"
    puts ""

    #puts "1. Atlanta Falcons -- Wins: 1 Losses: 3 Ties: 0"
    #puts "2. Buffalo Bills -- Wins: 3 Losses: 1 Ties: 0"

    standing_1 = self.new
    standing_1.team_name = "Atlanta Falcons"
    standing_1.wins = "1"
    standing_1.losses = "5"
    standing_1.ties = "0"

    standing_2 = self.new
    standing_2.team_name = "Atlanta Falcons"
    standing_2.wins = "1"
    standing_2.losses = "5"
    standing_2.ties = "0"

    [standing_1, standing_2]
  end

  def self.all_afc_teams_standings
    ##I should return all afc teams stats
    puts ""
    puts "---------- AFC Standings ----------"
    puts ""

    standing_1 = self.new
    standing_1.team_name = "Atlanta Falcons"
    standing_1.wins = "1"
    standing_1.losses = "5"
    standing_1.ties = "0"

    standing_2 = self.new
    standing_2.team_name = "Atlanta Falcons"
    standing_2.wins = "1"
    standing_2.losses = "5"
    standing_2.ties = "0"

    [standing_1, standing_2]
  end

  def self.all_nfc_teams_standings
    #I should return all nfc teams stats
    puts ""
    puts "---------- NFC Standings ----------"
    puts ""

    standing_1 = self.new
    standing_1.team_name = "Atlanta Falcons"
    standing_1.wins = "1"
    standing_1.losses = "5"
    standing_1.ties = "0"

    standing_2 = self.new
    standing_2.team_name = "Atlanta Falcons"
    standing_2.wins = "1"
    standing_2.losses = "5"
    standing_2.ties = "0"

    [standing_1, standing_2]
  end

end

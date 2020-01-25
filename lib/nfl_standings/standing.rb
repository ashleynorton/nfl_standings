class NflStandings::Standing

  attr_accessor :team, :wins, :losses, :ties, :conference

  @@all = []

  def initialize(team, wins, losses, ties, conference)
    @team = team
    @wins = wins
    @losses = losses
    @ties = ties
    @conference = conference
    self.save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end


  def self.get_afc
    self.all.select do |team|
      team.conference == "AFC"
    end
  end

  def self.get_nfc
    self.all.select do |team|
      team.conference == "NFC"
    end
  end

end

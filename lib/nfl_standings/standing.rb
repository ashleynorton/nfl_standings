class NflStandings::Standing

  attr_accessor :team_name, :stats, :wins, :losses, :ties

  @@doc = Nokogiri::HTML(open("https://www.espn.com/nfl/standings"))

  @@team_name = @@doc.css(".ResponsiveTable").css(".hide-mobile").css("a").map do |anchor| anchor.text end



  def self.scrape_espn

    #binding.pry

    self.cli
  end

  def self.split_array(arr)
    ultimate_arr = []

    i = 0

    while i < 32
      new_arr = arr.shift(12)
      ultimate_arr << new_arr
      i += 1
    end
    ultimate_arr
  end

  def self.cli

    @@stats = @@doc.css("table:not(.Table--fixed-left)").css(".Table__TR[data-idx]").css(".stat-cell").map do |td| td.text end
    @@split_stats = self.split_array(@@stats)

    @nested_array = @@team_name.zip @@split_stats
    #binding.pry

    @flattened_array = @nested_array.map {|elem| elem.flatten }

    @flattened_array.map do |items|
      team = items[0]
      wins = items[1]
      losses = items[2]
      ties = items[3]
      puts "#{team} --- Wins: #{wins} Losses: #{losses} Ties: #{ties}"
    end
  end

  def self.all_nfl_teams_standings
    #Scrape espn/nfl/standings and then return standings based on that data
    puts ""
    puts "---------- All NFL Team Standings ----------"
    puts ""

    @@all_standings = []

    @@all_standings << self.scrape_espn

  end

  def self.all_afc_teams_standings
    ##I should return all afc teams stats
    puts ""
    puts "---------- AFC Standings ----------"
    puts ""

    @@all_standings = []

    @@all_standings << self.scrape_espn

  end

  def self.all_nfc_teams_standings
    #I should return all nfc teams stats
    puts ""
    puts "---------- NFC Standings ----------"
    puts ""

    @@all_standings = []

    @@all_standings << self.scrape_espn

  end


end

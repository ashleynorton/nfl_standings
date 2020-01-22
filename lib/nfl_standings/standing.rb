class NflStandings::Standing

  attr_accessor :team_name, :stats, :wins, :losses, :ties

  @@doc = Nokogiri::HTML(open("https://www.espn.com/nfl/standings"))

  @@team_name = @@doc.css(".ResponsiveTable").css(".hide-mobile").css("a").map do |anchor| anchor.text end



  def self.split_array(arr, num1, num2)
    ultimate_arr = []

    i = num1

    while i < num2
      new_arr = arr.shift(12)
      ultimate_arr << new_arr
      i += 1
    end
    ultimate_arr
  end

  def self.all
    @all_stats = @@doc.css("table:not(.Table--fixed-left)").css(".Table__TR[data-idx]").css(".stat-cell").map do |td| td.text end

    @split_stats = self.split_array(@all_stats, 0, 32)
    #binding.pry
    @nested_array = @@team_name.zip @split_stats
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

  def self.afc
    @afc_stats = @@doc.css("table:not(.Table--fixed-left)").css(".Table__TR[data-idx]").css(".stat-cell").map do |td| td.text end

    @split_stats = self.split_array(@afc_stats, 0, 16)

    @nested_array = @@team_name.slice(0..15).zip @split_stats

    @flattened_array = @nested_array.map {|elem| elem.flatten }

    @flattened_array.map do |items|
      team = items[0]
      wins = items[1]
      losses = items[2]
      ties = items[3]
      puts "#{team} --- Wins: #{wins} Losses: #{losses} Ties: #{ties}"
    end
  end

  def self.nfc
    @nfc_stats = @@doc.css("table:not(.Table--fixed-left)").css(".Table__TR[data-idx]").css(".stat-cell").map do |td| td.text end

    @split_stats = self.split_array(@nfc_stats, 16, 32)
    binding.pry
    @nested_array = @@team_name.slice(16..32).zip @split_stats


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

    self.all

  end

  def self.all_afc_teams_standings
    ##I should return all afc teams stats
    puts ""
    puts "---------- AFC Standings ----------"
    puts ""

    self.afc

  end

  def self.all_nfc_teams_standings
    #I should return all nfc teams stats
    puts ""
    puts "---------- NFC Standings ----------"
    puts ""

    self.nfc

  end


end

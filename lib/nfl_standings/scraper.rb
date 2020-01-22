class NflStandings::Scraper

  attr_accessor :team, :wins, :losses, :ties


#SCRAPED SITE
  @@doc = Nokogiri::HTML(open("https://www.espn.com/nfl/standings"))

#SCRAPED TEAM DIVISIONS
  @@all_teams = @@doc.css(".ResponsiveTable").css(".hide-mobile").css("a").map do |anchor| anchor.text end

  @@afc_teams = @@all_teams.slice(0..15)

  @@nfc_teams = @@all_teams.slice(16..32)

#SCRAPED DIVISION STATS
  @@all_stats = @@doc.css("table:not(.Table--fixed-left)").css(".Table__TR[data-idx]").css(".stat-cell").map do |td| td.text end

  @@afc_stats = @@all_stats[0..192]

  @@nfc_stats = @@all_stats[192..384]

#ARRAY SPLITTER
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

#SCRAPES INFO FOR ALL TEAMS
  def self.all

    @split_stats = self.split_array(@@all_stats, 0, 32)

    @nested_array = @@all_teams.zip @split_stats

    @flattened_array = @nested_array.map {|elem| elem.flatten }

    @flattened_array.map do |items|
      team = items[0]
      wins = items[1]
      losses = items[2]
      ties = items[3]
      puts "#{team} --- Wins: #{wins} Losses: #{losses} Ties: #{ties}"
    end
  end

#SCRAPES INFO FOR AFC TEAMS
  def self.afc

    @split_stats = self.split_array(@@afc_stats, 0, 16)

    @nested_array = @@afc_teams.zip @split_stats

    @flattened_array = @nested_array.map {|elem| elem.flatten }

    @flattened_array.map do |items|
      team = items[0]
      wins = items[1]
      losses = items[2]
      ties = items[3]
      puts "#{team} --- Wins: #{wins} Losses: #{losses} Ties: #{ties}"
    end
  end

#SCRAPES INFO FOR NFC TEAMS
  def self.nfc

    @split_stats = self.split_array(@@nfc_stats, 0, 16)

    @nested_array = @@nfc_teams.zip @split_stats

    @flattened_array = @nested_array.map {|elem| elem.flatten }

    @flattened_array.map do |items|
      team = items[0]
      wins = items[1]
      losses = items[2]
      ties = items[3]
      puts "#{team} --- Wins: #{wins} Losses: #{losses} Ties: #{ties}"
    end
  end
  
end

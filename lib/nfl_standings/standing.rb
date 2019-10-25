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
    #binding.pry


    @@standing = self.new
    self.team_names
    #self.scores
    #doc.css(".ResponsiveTable").css(".hide-mobile").text
    #doc.css(".ResponsiveTable").css(".hide-mobile").css("a").first.text
    #doc.css(".ResponsiveTable").css(".hide-mobile").css("a").map do |anchor| anchor.text end
    #standing.team_name.each do |team|
      #puts "#{team}"
    #end
    #standing.team_name.each {|n| @@standings << n.text.strip}
    #binding.pry
    @@standing.wins = @@doc.css("table:not(.Table--fixed-left)").css(".Table__TR").css("tr:not(.Table__sub-header)")[0].text
    @@standing.losses = @@doc.css(".Table__TD").css(".stat-cell")[1].text
    @@standing.ties = @@doc.css(".Table__TD").css(".stat-cell")[2].text

    @@standing
  end

  def self.team_names

    @team_name = @@doc.css(".ResponsiveTable").css(".hide-mobile").css("a").map do |anchor| anchor.text end
    @scores = @@doc.css("table:not(.Table--fixed-left)").css(".Table__TR").css("tr:not(.Table__sub-header)").map do |td| td.text end
    @team_name.each.with_index(1) do |team, index|
      @scores.each do |i|
        puts "#{index}. #{team} -- Wins: #{i[0]} Losses: #{i[1]} Ties: #{i[2]}"
      end
    end

  end

  #def self.wins
    #scores_array = []
    #@scores = @@doc.css("table:not(.Table--fixed-left)").css(".Table__TR").css("tr:not(.Table__sub-header)").map do |td|
      #score = td.text
      #scores_array.push(score)
    #end
    #scores_array
    #@@scores.each do |score| score end

    #@@scores.each do |score| puts score[0] end
    #@@individual_scores.each do |individual_score|
    #  individual_score
    #end
    #@@test = @@individual_scores.map do |individual_score| individual_score[0] end
    #@@test[0]

    #@losses =
    #@ties =
  #end

  def self.scrape_all_standings
    @@all_standings = []

    @@all_standings << self.scrape_espn

    @@all_standings
  end



  def self.scrape_afc_standings
    @@standings = []

    @@standings << self.scrape_espn

    @@standings
  end

  def self.scrape_nfc_standings

  end
end

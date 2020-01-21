def self.scrape
  @@doc = Nokogiri::HTML(open("https://www.nfl.com/standings"))
  binding.pry
  self.cli
end

# def self.cli 
#   @team_name =
# end

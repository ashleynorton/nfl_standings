require_relative './lib/nfl_standings.rb'

class Scraper

  def get_page
    doc = Nokogiri::HTML(open("https://www.espn.com/nfl/standings"))
  end

  def scrape_standings_index
    self.get_page.css(".ResponsiveTable").css(".hide-mobile").text
  end

  def create_standings
    scrape_standings_index.each do |doc|
      Standing.new
      team_name
      wins
      losses
      ties
    end
  end

end

Scraper.new.get_page

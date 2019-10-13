require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './standing.rb'

class NflStandings::Scraper

  def get_page
    doc = Nokogiri::HTML(open("https://www.espn.com/nfl/standings"))
  end

  def get_standings
    self.get_page.css(".ResponsiveTable").css(".hide-mobile").text
  end

  def create_standings
    self.get_standings.each do |each_standing|
      standing = NflStandings::Standing.new
      standing.team_name = tea
      wins
      losses
      ties
    end
  end

end

NflStandings::Scraper.new.get_page

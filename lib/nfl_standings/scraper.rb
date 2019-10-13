require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './standing.rb'

class NflStandings::Scraper

  def get_page
    Nokogiri::HTML(open("https://www.espn.com/nfl/standings"))
  end

  def get_standings
    self.get_page.css(".ResponsiveTable").css(".hide-mobile").text
  end

  def create_standings
    get_standings.each do |standing|
      NflStandings::Standing.new_from_index_page(standing)
    end
  end

end

NflStandings::Scraper.new.get_page

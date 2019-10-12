require 'nokogiri'
require 'open-uri'

class Scraper
  
  def get_page
    doc = Nokogiri::HTML(open("https://www.espn.com/nfl/standings"))
  end 
  
  
end 
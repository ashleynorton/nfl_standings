class NflStandings::Scraper
  
  def get_page
    doc = Nokogiri::HTML(open("https://www.espn.com/nfl/standings"))
    
    binding.pry 
  end 
  
end 

Scraper.new.get_page
class NflStandings::Scraper

  def self.get_all

    doc = Nokogiri::HTML(open("https://www.foxsports.com/nfl/standings"))

    index = 0

    team_list = doc.css(".wisbb_fvStand .wisbb_fullTeam").each do |elem|
      team = elem.css("img").attr("alt").value

      result = doc.css(".wisbb_fvStand").css("td").css(".wisbb_priorityColumn").children

      if index < result.length - 3
        win = result[index].text
        losses = result[index + 1].text
        ties = result[index + 2].text
        conference = "AFC"

        if index >= 64
          conference = "NFC"
        end
        NflStandings::Standing.new(team, win, losses, ties, conference)
        index = index + 4
      end
    end
  end

end

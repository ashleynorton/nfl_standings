NFL Standings

user types 'nfl-standings'

1. American Football Conference (AFC)
2. National Football Conference (NFC)

Which NFL Conference standings would you like to view?

User types '1' or '2'...a list of the teams (in alphabetical order) display with their record (example below):

1. Atlanta Falcons -- Wins: 1 Losses: 3 Ties: 0
2. Buffalo Bills -- Wins: 3 Losses: 1 Ties: 0

Choose a different conference or type 'exit'.

SCRAPING:

The section with all of the information is listed under the class (".ResponsiveTable")

There are 2...one for AFC and one for NFC  spelled out listed under class (".Table_Title")


This got me this:

doc.css(".ResponsiveTable").css(".hide-mobile").css("a").text

OR

doc.css(".ResponsiveTable").css(".Table__TD").css(".hide-mobile").css(".AnchorLink").text

OR

doc.css(".ResponsiveTable").css(".hide-mobile").text (provides the same thing)

=> "New England PatriotsBuffalo BillsNew York JetsMiami DolphinsBaltimore RavensCleveland BrownsPittsburgh SteelersCincinnati BengalsHouston TexansIndianapolisColtsJacksonville JaguarsTennessee TitansKansas City ChiefsOakland RaidersLos Angeles ChargersDenver BroncosPhiladelphia EaglesDallas CowboysNew York GiantsWashington RedskinsGreen Bay PackersDetroit LionsChicago BearsMinnesota VikingsNew Orleans SaintsCarolina PanthersTampa Bay BuccaneersAtlanta FalconsSan Francisco 49ersSeattle SeahawksLos Angeles RamsArizona Cardinals"

This got me this:

pry(#<Scraper>)> doc.css(".ResponsiveTable").css("a")[0].text
=> ""
[4] pry(#<Scraper>)> doc.css(".ResponsiveTable").css("a")[1].text
=> "NE"
[5] pry(#<Scraper>)> doc.css(".ResponsiveTable").css("a")[2].text
=> "New England Patriots"


This got me this:

pry(#<Scraper>)> doc.css(".ResponsiveTable").css(".hide-mobile").css("a")[0].text
=> "New England Patriots"
[8] pry(#<Scraper>)> doc.css(".ResponsiveTable").css(".hide-mobile").css("a")[1].text
=> "Buffalo Bills"
[9] pry(#<Scraper>)> doc.css(".ResponsiveTable").css(".hide-mobile").css("a")[4].text
=> "Baltimore Ravens"
[10] pry(#<Scraper>)> doc.css(".ResponsiveTable").css(".hide-mobile").css("a")[5].text
=> "Cleveland Browns"



doc.css(".ResponsiveTable").css(".hide-mobile").css("a").first.text

--------------------------------------------------------
The page itself:

doc = Nokogiri::HTML(open("https://www.espn.com/nfl/standings"))

The collection of teams:

doc.css(".ResponsiveTable").css(".hide-mobile").text

#doc.css(".ResponsiveTable").css(".hide-mobile").css("a").text

The name of an individual team:

doc.css(".ResponsiveTable").css(".hide-mobile").css("a").first.text

The wins of an individual team:

doc.css(".Table__TD").css(".stat-cell").first.text

The losses of an individual team:

doc.css(".Table__TD").css(".stat-cell")[1].text

The ties of an individual team:

doc.css(".Table__TD").css(".stat-cell")[2].text


----------------------------------------------------------


def team_name
  @team_name = doc.css(".ResponsiveTable").css(".hide-mobile").css("a").text
end

def wins
  @wins = doc.css(".Table__TD").css(".stat-cell")[0].text
end

def losses
  @losses = doc.css(".Table__TD").css(".stat-cell")[1].text
end

def ties
  @ties = doc.css(".Table__TD").css(".stat-cell")[2].text
end



===========================================================

1. Figure out way to print more than one standing
2. Create method that somehow separates the all_nfl_teams_standings into half to create 1-16 for all_afc_teams_standings and 17-32 for all_nfc_teams_standings
3. Fix the cli when you type exit so that it doesn't show the "error" message and just shows the goodbye message.

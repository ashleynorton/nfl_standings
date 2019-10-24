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



doc.css(".ResponsiveTable").css(".hide-mobile").css("a").map do |anchor| anchor.text end ..... Team Names

doc.css(".ResponsiveTable").css(".hide-mobile").css("a").map do |anchor| anchor.text end
=> ["New England Patriots",
 "Buffalo Bills",
 "New York Jets",
 "Miami Dolphins",
 "Baltimore Ravens",
 "Cleveland Browns",
 "Pittsburgh Steelers",
 "Cincinnati Bengals",
 "Indianapolis Colts",
 "Houston Texans",
 "Jacksonville Jaguars",
 "Tennessee Titans",
 "Kansas City Chiefs",
 "Oakland Raiders",
 "Denver Broncos",
 "Los Angeles Chargers",
 "Dallas Cowboys",
 "Philadelphia Eagles",
 "New York Giants",
 "Washington Redskins",
 "Green Bay Packers",
 "Minnesota Vikings",
 "Chicago Bears",
 "Detroit Lions",
 "New Orleans Saints",
 "Carolina Panthers",
 "Tampa Bay Buccaneers",
 "Atlanta Falcons",
 "San Francisco 49ers",
 "Seattle Seahawks",
 "Los Angeles Rams",
 "Arizona Cardinals"]



doc.css("table:not(.Table--fixed-left)").css(".Table__TR").css("tr:not(.Table__sub-header)") ... Scores

doc.css("table:not(.Table--fixed-left)").css(".Table__TR").css("tr:not(.Table__sub-header)")
<tr class="Table__TR Table__TR--sm Table__even" data-idx="1">
<td class="Table__TD"><span class="stat-cell">6</span></td>
<td class="Table__TD"><span class="stat-cell">0</span></td>
<td class="Table__TD"><span class="stat-cell">0</span></td>
<td class="Table__TD"><span class="stat-cell">1.000</span></td>
<td class="Table__TD"><span class="stat-cell">3-0</span></td>
<td class="Table__TD"><span class="stat-cell">3-0</span></td>
<td class="Table__TD"><span class="stat-cell">3-0</span></td>
<td class="Table__TD"><span class="stat-cell">4-0</span></td>
<td class="Table__TD"><span class="stat-cell">190</span></td>
<td class="Table__TD"><span class="stat-cell">48</span></td>
<td class="Table__TD"><span class="stat-cell clr-positive">+142</span></td>
<td class="Table__TD"><span class="stat-cell">W6</span></td>
</tr>
<tr class="filled Table__TR Table__TR--sm Table__even" data-idx="2">
<td class="Table__TD"><span class="stat-cell">5</span></td>
<td class="Table__TD"><span class="stat-cell">1</span></td>
<td class="Table__TD"><span class="stat-cell">0</span></td>
<td class="Table__TD"><span class="stat-cell">.833</span></td>
<td class="Table__TD"><span class="stat-cell">2-1</span></td>
<td class="Table__TD"><span class="stat-cell">3-0</span></td>
<td class="Table__TD"><span class="stat-cell">2-1</span></td>
<td class="Table__TD"><span class="stat-cell">4-1</span></td>
<td class="Table__TD"><span class="stat-cell">121</span></td>
<td class="Table__TD"><span class="stat-cell">91</span></td>
<td class="Table__TD"><span class="stat-cell clr-positive">+30</span></td>
<td class="Table__TD"><span class="stat-cell">W2</span></td>
</tr>
<tr class="Table__TR Table__TR--sm Table__even" data-idx="3">
<td class="Table__TD"><span class="stat-cell">1</span></td>
<td class="Table__TD"><span class="stat-cell">4</span></td>
<td class="Table__TD"><span class="stat-cell">0</span></td>
<td class="Table__TD"><span class="stat-cell">.200</span></td>
<td class="Table__TD"><span class="stat-cell">1-2</span></td>
<td class="Table__TD"><span class="stat-cell">0-2</span></td>
<td class="Table__TD"><span class="stat-cell">0-2</span></td>
<td class="Table__TD"><span class="stat-cell">0-3</span></td>
<td class="Table__TD"><span class="stat-cell">63</span></td>
<td class="Table__TD"><span class="stat-cell">123</span></td>
<td class="Table__TD"><span class="stat-cell clr-negative">-60</span></td>
<td class="Table__TD"><span class="stat-cell">W1</span></td>
</tr>
<tr class="no-border-bottom filled Table__TR Table__TR--sm Table__even" data-idx="4">
<td class="Table__TD"><span class="stat-cell">0</span></td>
<td class="Table__TD"><span class="stat-cell">6</span></td>
<td class="Table__TD"><span class="stat-cell">0</span></td>
<td class="Table__TD"><span class="stat-cell">.000</span></td>
<td class="Table__TD"><span class="stat-cell">0-4</span></td>
<td class="Table__TD"><span class="stat-cell">0-2</span></td>
<td class="Table__TD"><span class="stat-cell">0-2</span></td>
<td class="Table__TD"><span class="stat-cell">0-4</span></td>
<td class="Table__TD"><span class="stat-cell">63</span></td>
<td class="Table__TD"><span class="stat-cell">211</span></td>
<td class="Table__TD"><span class="stat-cell clr-negative">-148</span></td>
<td class="Table__TD"><span class="stat-cell">L6</span></td>
</tr>
<tr class="Table__TR Table__TR--sm Table__even" data-idx="6">
<td class="Table__TD"><span class="stat-cell">5</span></td>
<td class="Table__TD"><span class="stat-cell">2</span></td>
<td class="Table__TD"><span class="stat-cell">0</span></td>
<td class="Table__TD"><span class="stat-cell">.714</span></td>
<td class="Table__TD"><span class="stat-cell">2-1</span></td>
<td class="Table__TD"><span class="stat-cell">3-1</span></td>
<td class="Table__TD"><span class="stat-cell">2-1</span></td>
<td class="Table__TD"><span class="stat-cell">3-2</span></td>
<td class="Table__TD"><span class="stat-cell">214</span></td>
<td class="Table__TD"><span class="stat-cell">156</span></td>
<td class="Table__TD"><span class="stat-cell clr-positive">+58</span></td>
<td class="Table__TD"><span class="stat-cell">W3</span></td>
</tr>
<tr class="filled Table__TR Table__TR--sm Table__even" data-idx="7">
<td class="Table__TD"><span class="stat-cell">2</span></td>
<td class="Table__TD"><span class="stat-cell">4</span></td>
<td class="Table__TD"><span class="stat-cell">0</span></td>
<td class="Table__TD"><span class="stat-cell">.333</span></td>
<td class="Table__TD"><span class="stat-cell">0-3</span></td>
<td class="Table__TD"><span class="stat-cell">2-1</span></td>
<td class="Table__TD"><span class="stat-cell">1-0</span></td>
<td class="Table__TD"><span class="stat-cell">2-1</span></td>
<td class="Table__TD"><span class="stat-cell">120</span></td>
<td class="Table__TD"><span class="stat-cell">154</span></td>
<td class="Table__TD"><span class="stat-cell clr-negative">-34</span></td>
<td class="Table__TD"><span class="stat-cell">L2</span></td>
</tr>
<tr class="Table__TR Table__TR--sm Table__even" data-idx="8">
<td class="Table__TD"><span class="stat-cell">2</span></td>
<td class="Table__TD"><span class="stat-cell">4</span></td>
<td class="Table__TD"><span class="stat-cell">0</span></td>
<td class="Table__TD"><span class="stat-cell">.333</span></td>
<td class="Table__TD"><span class="stat-cell">1-2</span></td>
<td class="Table__TD"><span class="stat-cell">1-2</span></td>
<td class="Table__TD"><span class="stat-cell">1-1</span></td>
<td class="Table__TD"><span class="stat-cell">2-2</span></td>
<td class="Table__TD"><span class="stat-cell">123</span></td>
<td class="Table__TD"><span class="stat-cell">131</span></td>
<td class="Table__TD"><span class="stat-cell clr-negative">-8</span></td>
<td class="Table__TD"><span class="stat-cell">W1</span></td>
</tr>
<tr class="no-border-bottom filled Table__TR Table__TR--sm Table__even" data-idx="9">
<td class="Table__TD"><span class="stat-cell">0</span></td>
<td class="Table__TD"><span class="stat-cell">7</span></td>
<td class="Table__TD"><span class="stat-cell">0</span></td>
<td class="Table__TD"><span class="stat-cell">.000</span></td>
<td class="Table__TD"><span class="stat-cell">0-3</span></td>
<td class="Table__TD"><span class="stat-cell">0-4</span></td>
<td class="Table__TD"><span class="stat-cell">0-2</span></td>
<td class="Table__TD"><span class="stat-cell">0-4</span></td>
<td class="Table__TD"><span class="stat-cell">114</span></td>
<td class="Table__TD"><span class="stat-cell">186</span></td>
<td class="Table__TD"><span class="stat-cell clr-negative">-72</span></td>
<td class="Table__TD"><span class="stat-cell">L7</span></td>
</tr>
<tr class="Table__TR Table__TR--sm Table__even" data-idx="11">
<td class="Table__TD"><span class="stat-cell">4</span></td>
<td class="Table__TD"><span class="stat-cell">2</span></td>
<td class="Table__TD"><span class="stat-cell">0</span></td>
<td class="Table__TD"><span class="stat-cell">.667</span></td>
<td class="Table__TD"><span class="stat-cell">2-1</span></td>
<td class="Table__TD"><span class="stat-cell">2-1</span></td>
<td class="Table__TD"><span class="stat-cell">2-0</span></td>
<td class="Table__TD"><span class="stat-cell">3-2</span></td>
<td class="Table__TD"><span class="stat-cell">143</span></td>
<td class="Table__TD"><span class="stat-cell">138</span></td>
<td class="Table__TD"><span class="stat-cell clr-positive">+5</span></td>
<td class="Table__TD"><span class="stat-cell">W2</span></td>
</tr>
<tr class="filled Table__TR Table__TR--sm Table__even" data-idx="12">
<td class="Table__TD"><span class="stat-cell">4</span></td>
<td class="Table__TD"><span class="stat-cell">3</span></td>
<td class="Table__TD"><span class="stat-cell">0</span></td>
<td class="Table__TD"><span class="stat-cell">.571</span></td>
<td class="Table__TD"><span class="stat-cell">2-1</span></td>
<td class="Table__TD"><span class="stat-cell">2-2</span></td>
<td class="Table__TD"><span class="stat-cell">1-1</span></td>
<td class="Table__TD"><span class="stat-cell">3-1</span></td>
<td class="Table__TD"><span class="stat-cell">185</span></td>
<td class="Table__TD"><span class="stat-cell">164</span></td>
<td class="Table__TD"><span class="stat-cell clr-positive">+21</span></td>
<td class="Table__TD"><span class="stat-cell">L1</span></td>
</tr>
<tr class="Table__TR Table__TR--sm Table__even" data-idx="13">
<td class="Table__TD"><span class="stat-cell">3</span></td>
<td class="Table__TD"><span class="stat-cell">4</span></td>
<td class="Table__TD"><span class="stat-cell">0</span></td>
<td class="Table__TD"><span class="stat-cell">.429</span></td>
<td class="Table__TD"><span class="stat-cell">1-2</span></td>
<td class="Table__TD"><span class="stat-cell">2-2</span></td>
<td class="Table__TD"><span class="stat-cell">1-1</span></td>
<td class="Table__TD"><span class="stat-cell">3-2</span></td>
<td class="Table__TD"><span class="stat-cell">144</span></td>
<td class="Table__TD"><span class="stat-cell">148</span></td>
<td class="Table__TD"><span class="stat-cell clr-negative">-4</span></td>
<td class="Table__TD"><span class="stat-cell">W1</span></td>
</tr>
<tr class="no-border-bottom filled Table__TR Table__TR--sm Table__even" data-idx="14">
<td class="Table__TD"><span class="stat-cell">3</span></td>
<td class="Table__TD"><span class="stat-cell">4</span></td>
<td class="Table__TD"><span class="stat-cell">0</span></td>
<td class="Table__TD"><span class="stat-cell">.429</span></td>
<td class="Table__TD"><span class="stat-cell">1-2</span></td>
<td class="Table__TD"><span class="stat-cell">2-2</span></td>
<td class="Table__TD"><span class="stat-cell">0-2</span></td>
<td class="Table__TD"><span class="stat-cell">2-4</span></td>
<td class="Table__TD"><span class="stat-cell">121</span></td>
<td class="Table__TD"><span class="stat-cell">112</span></td>
<td class="Table__TD"><span class="stat-cell clr-positive">+9</span></td>
<td class="Table__TD"><span class="stat-cell">W1</span></td>
</tr>
<tr class="Table__TR Table__TR--sm Table__even" data-idx="16">
<td class="Table__TD"><span class="stat-cell">5</span></td>
<td class="Table__TD"><span class="stat-cell">2</span></td>
<td class="Table__TD"><span class="stat-cell">0</span></td>
<td class="Table__TD"><span class="stat-cell">.714</span></td>
<td class="Table__TD"><span class="stat-cell">1-2</span></td>
<td class="Table__TD"><span class="stat-cell">4-0</span></td>
<td class="Table__TD"><span class="stat-cell">2-0</span></td>
<td class="Table__TD"><span class="stat-cell">4-2</span></td>
<td class="Table__TD"><span class="stat-cell">202</span></td>
<td class="Table__TD"><span class="stat-cell">150</span></td>
<td class="Table__TD"><span class="stat-cell clr-positive">+52</span></td>
<td class="Table__TD"><span class="stat-cell">W1</span></td>
</tr>
<tr class="filled Table__TR Table__TR--sm Table__even" data-idx="17">
<td class="Table__TD"><span class="stat-cell">3</span></td>
<td class="Table__TD"><span class="stat-cell">3</span></td>
<td class="Table__TD"><span class="stat-cell">0</span></td>
<td class="Table__TD"><span class="stat-cell">.500</span></td>
<td class="Table__TD"><span class="stat-cell">2-1</span></td>
<td class="Table__TD"><span class="stat-cell">1-2</span></td>
<td class="Table__TD"><span class="stat-cell">1-1</span></td>
<td class="Table__TD"><span class="stat-cell">2-1</span></td>
<td class="Table__TD"><span class="stat-cell">127</span></td>
<td class="Table__TD"><span class="stat-cell">165</span></td>
<td class="Table__TD"><span class="stat-cell clr-negative">-38</span></td>
<td class="Table__TD"><span class="stat-cell">L1</span></td>
</tr>
<tr class="Table__TR Table__TR--sm Table__even" data-idx="18">
<td class="Table__TD"><span class="stat-cell">2</span></td>
<td class="Table__TD"><span class="stat-cell">5</span></td>
<td class="Table__TD"><span class="stat-cell">0</span></td>
<td class="Table__TD"><span class="stat-cell">.286</span></td>
<td class="Table__TD"><span class="stat-cell">1-3</span></td>
<td class="Table__TD"><span class="stat-cell">1-2</span></td>
<td class="Table__TD"><span class="stat-cell">1-2</span></td>
<td class="Table__TD"><span class="stat-cell">2-3</span></td>
<td class="Table__TD"><span class="stat-cell">112</span></td>
<td class="Table__TD"><span class="stat-cell">136</span></td>
<td class="Table__TD"><span class="stat-cell clr-negative">-24</span></td>
<td class="Table__TD"><span class="stat-cell">L1</span></td>
</tr>
<tr class="no-border-bottom filled Table__TR Table__TR--sm Table__even" data-idx="19">
<td class="Table__TD"><span class="stat-cell">2</span></td>
<td class="Table__TD"><span class="stat-cell">5</span></td>
<td class="Table__TD"><span class="stat-cell">0</span></td>
<td class="Table__TD"><span class="stat-cell">.286</span></td>
<td class="Table__TD"><span class="stat-cell">1-3</span></td>
<td class="Table__TD"><span class="stat-cell">1-2</span></td>
<td class="Table__TD"><span class="stat-cell">0-1</span></td>
<td class="Table__TD"><span class="stat-cell">2-4</span></td>
<td class="Table__TD"><span class="stat-cell">140</span></td>
<td class="Table__TD"><span class="stat-cell">141</span></td>
<td class="Table__TD"><span class="stat-cell clr-negative">-1</span></td>
<td class="Table__TD"><span class="stat-cell">L3</span></td>
</tr>
<tr class="Table__TR Table__TR--sm Table__even" data-idx="1">
<td class="Table__TD"><span class="stat-cell">4</span></td>
<td class="Table__TD"><span class="stat-cell">3</span></td>
<td class="Table__TD"><span class="stat-cell">0</span></td>
<td class="Table__TD"><span class="stat-cell">.571</span></td>
<td class="Table__TD"><span class="stat-cell">3-1</span></td>
<td class="Table__TD"><span class="stat-cell">1-2</span></td>
<td class="Table__TD"><span class="stat-cell">3-0</span></td>
<td class="Table__TD"><span class="stat-cell">3-2</span></td>
<td class="Table__TD"><span class="stat-cell">190</span></td>
<td class="Table__TD"><span class="stat-cell">124</span></td>
<td class="Table__TD"><span class="stat-cell clr-positive">+66</span></td>
<td class="Table__TD"><span class="stat-cell">W1</span></td>
</tr>
<tr class="filled Table__TR Table__TR--sm Table__even" data-idx="2">
<td class="Table__TD"><span class="stat-cell">3</span></td>
<td class="Table__TD"><span class="stat-cell">4</span></td>
<td class="Table__TD"><span class="stat-cell">0</span></td>
<td class="Table__TD"><span class="stat-cell">.429</span></td>
<td class="Table__TD"><span class="stat-cell">2-1</span></td>
<td class="Table__TD"><span class="stat-cell">1-3</span></td>
<td class="Table__TD"><span class="stat-cell">1-1</span></td>
<td class="Table__TD"><span class="stat-cell">2-4</span></td>
<td class="Table__TD"><span class="stat-cell">171</span></td>
<td class="Table__TD"><span class="stat-cell">186</span></td>
<td class="Table__TD"><span class="stat-cell clr-negative">-15</span></td>
<td class="Table__TD"><span class="stat-cell">L2</span></td>
</tr>
<tr class="Table__TR Table__TR--sm Table__even" data-idx="3">
<td class="Table__TD"><span class="stat-cell">2</span></td>
<td class="Table__TD"><span class="stat-cell">5</span></td>
<td class="Table__TD"><span class="stat-cell">0</span></td>
<td class="Table__TD"><span class="stat-cell">.286</span></td>
<td class="Table__TD"><span class="stat-cell">1-3</span></td>
<td class="Table__TD"><span class="stat-cell">1-2</span></td>
<td class="Table__TD"><span class="stat-cell">1-1</span></td>
<td class="Table__TD"><span class="stat-cell">2-3</span></td>
<td class="Table__TD"><span class="stat-cell">132</span></td>
<td class="Table__TD"><span class="stat-cell">187</span></td>
<td class="Table__TD"><span class="stat-cell clr-negative">-55</span></td>
<td class="Table__TD"><span class="stat-cell">L3</span></td>
</tr>
<tr class="no-border-bottom filled Table__TR Table__TR--sm Table__even" data-idx="4">
<td class="Table__TD"><span class="stat-cell">1</span></td>
<td class="Table__TD"><span class="stat-cell">6</span></td>
<td class="Table__TD"><span class="stat-cell">0</span></td>
<td class="Table__TD"><span class="stat-cell">.143</span></td>
<td class="Table__TD"><span class="stat-cell">0-4</span></td>
<td class="Table__TD"><span class="stat-cell">1-2</span></td>
<td class="Table__TD"><span class="stat-cell">0-3</span></td>
<td class="Table__TD"><span class="stat-cell">0-5</span></td>
<td class="Table__TD"><span class="stat-cell">90</span></td>
<td class="Table__TD"><span class="stat-cell">176</span></td>
<td class="Table__TD"><span class="stat-cell clr-negative">-86</span></td>
<td class="Table__TD"><span class="stat-cell">L1</span></td>
</tr>
<tr class="Table__TR Table__TR--sm Table__even" data-idx="6">
<td class="Table__TD"><span class="stat-cell">6</span></td>
<td class="Table__TD"><span class="stat-cell">1</span></td>
<td class="Table__TD"><span class="stat-cell">0</span></td>
<td class="Table__TD"><span class="stat-cell">.857</span></td>
<td class="Table__TD"><span class="stat-cell">4-1</span></td>
<td class="Table__TD"><span class="stat-cell">2-0</span></td>
<td class="Table__TD"><span class="stat-cell">3-0</span></td>
<td class="Table__TD"><span class="stat-cell">4-1</span></td>
<td class="Table__TD"><span class="stat-cell">184</span></td>
<td class="Table__TD"><span class="stat-cell">139</span></td>
<td class="Table__TD"><span class="stat-cell clr-positive">+45</span></td>
<td class="Table__TD"><span class="stat-cell">W3</span></td>
</tr>
<tr class="filled Table__TR Table__TR--sm Table__even" data-idx="7">
<td class="Table__TD"><span class="stat-cell">5</span></td>
<td class="Table__TD"><span class="stat-cell">2</span></td>
<td class="Table__TD"><span class="stat-cell">0</span></td>
<td class="Table__TD"><span class="stat-cell">.714</span></td>
<td class="Table__TD"><span class="stat-cell">3-0</span></td>
<td class="Table__TD"><span class="stat-cell">2-2</span></td>
<td class="Table__TD"><span class="stat-cell">1-2</span></td>
<td class="Table__TD"><span class="stat-cell">4-2</span></td>
<td class="Table__TD"><span class="stat-cell">192</span></td>
<td class="Table__TD"><span class="stat-cell">123</span></td>
<td class="Table__TD"><span class="stat-cell clr-positive">+69</span></td>
<td class="Table__TD"><span class="stat-cell">W3</span></td>
</tr>
<tr class="Table__TR Table__TR--sm Table__even" data-idx="8">
<td class="Table__TD"><span class="stat-cell">3</span></td>
<td class="Table__TD"><span class="stat-cell">3</span></td>
<td class="Table__TD"><span class="stat-cell">0</span></td>
<td class="Table__TD"><span class="stat-cell">.500</span></td>
<td class="Table__TD"><span class="stat-cell">1-2</span></td>
<td class="Table__TD"><span class="stat-cell">2-1</span></td>
<td class="Table__TD"><span class="stat-cell">1-1</span></td>
<td class="Table__TD"><span class="stat-cell">2-2</span></td>
<td class="Table__TD"><span class="stat-cell">112</span></td>
<td class="Table__TD"><span class="stat-cell">105</span></td>
<td class="Table__TD"><span class="stat-cell clr-positive">+7</span></td>
<td class="Table__TD"><span class="stat-cell">L2</span></td>
</tr>
<tr class="no-border-bottom filled Table__TR Table__TR--sm Table__even" data-idx="9">
<td class="Table__TD"><span class="stat-cell">2</span></td>
<td class="Table__TD"><span class="stat-cell">3</span></td>
<td class="Table__TD"><span class="stat-cell">1</span></td>
<td class="Table__TD"><span class="stat-cell">.417</span></td>
<td class="Table__TD"><span class="stat-cell">1-2</span></td>
<td class="Table__TD"><span class="stat-cell">1-1-1</span></td>
<td class="Table__TD"><span class="stat-cell">0-2</span></td>
<td class="Table__TD"><span class="stat-cell">1-2-1</span></td>
<td class="Table__TD"><span class="stat-cell">149</span></td>
<td class="Table__TD"><span class="stat-cell">160</span></td>
<td class="Table__TD"><span class="stat-cell clr-negative">-11</span></td>
<td class="Table__TD"><span class="stat-cell">L3</span></td>
</tr>
<tr class="Table__TR Table__TR--sm Table__even" data-idx="11">
<td class="Table__TD"><span class="stat-cell">6</span></td>
<td class="Table__TD"><span class="stat-cell">1</span></td>
<td class="Table__TD"><span class="stat-cell">0</span></td>
<td class="Table__TD"><span class="stat-cell">.857</span></td>
<td class="Table__TD"><span class="stat-cell">3-0</span></td>
<td class="Table__TD"><span class="stat-cell">3-1</span></td>
<td class="Table__TD"><span class="stat-cell">1-0</span></td>
<td class="Table__TD"><span class="stat-cell">4-1</span></td>
<td class="Table__TD"><span class="stat-cell">164</span></td>
<td class="Table__TD"><span class="stat-cell">147</span></td>
<td class="Table__TD"><span class="stat-cell clr-positive">+17</span></td>
<td class="Table__TD"><span class="stat-cell">W5</span></td>
</tr>
<tr class="filled Table__TR Table__TR--sm Table__even" data-idx="12">
<td class="Table__TD"><span class="stat-cell">4</span></td>
<td class="Table__TD"><span class="stat-cell">2</span></td>
<td class="Table__TD"><span class="stat-cell">0</span></td>
<td class="Table__TD"><span class="stat-cell">.667</span></td>
<td class="Table__TD"><span class="stat-cell">1-2</span></td>
<td class="Table__TD"><span class="stat-cell">3-0</span></td>
<td class="Table__TD"><span class="stat-cell">1-1</span></td>
<td class="Table__TD"><span class="stat-cell">2-2</span></td>
<td class="Table__TD"><span class="stat-cell">166</span></td>
<td class="Table__TD"><span class="stat-cell">133</span></td>
<td class="Table__TD"><span class="stat-cell clr-positive">+33</span></td>
<td class="Table__TD"><span class="stat-cell">W4</span></td>
</tr>
<tr class="Table__TR Table__TR--sm Table__even" data-idx="13">
<td class="Table__TD"><span class="stat-cell">2</span></td>
<td class="Table__TD"><span class="stat-cell">4</span></td>
<td class="Table__TD"><span class="stat-cell">0</span></td>
<td class="Table__TD"><span class="stat-cell">.333</span></td>
<td class="Table__TD"><span class="stat-cell">0-3</span></td>
<td class="Table__TD"><span class="stat-cell">2-1</span></td>
<td class="Table__TD"><span class="stat-cell">1-2</span></td>
<td class="Table__TD"><span class="stat-cell">2-4</span></td>
<td class="Table__TD"><span class="stat-cell">173</span></td>
<td class="Table__TD"><span class="stat-cell">185</span></td>
<td class="Table__TD"><span class="stat-cell clr-negative">-12</span></td>
<td class="Table__TD"><span class="stat-cell">L2</span></td>
</tr>
<tr class="no-border-bottom filled Table__TR Table__TR--sm Table__even" data-idx="14">
<td class="Table__TD"><span class="stat-cell">1</span></td>
<td class="Table__TD"><span class="stat-cell">6</span></td>
<td class="Table__TD"><span class="stat-cell">0</span></td>
<td class="Table__TD"><span class="stat-cell">.143</span></td>
<td class="Table__TD"><span class="stat-cell">1-2</span></td>
<td class="Table__TD"><span class="stat-cell">0-4</span></td>
<td class="Table__TD"><span class="stat-cell">0-0</span></td>
<td class="Table__TD"><span class="stat-cell">1-3</span></td>
<td class="Table__TD"><span class="stat-cell">145</span></td>
<td class="Table__TD"><span class="stat-cell">223</span></td>
<td class="Table__TD"><span class="stat-cell clr-negative">-78</span></td>
<td class="Table__TD"><span class="stat-cell">L5</span></td>
</tr>
<tr class="Table__TR Table__TR--sm Table__even" data-idx="16">
<td class="Table__TD"><span class="stat-cell">6</span></td>
<td class="Table__TD"><span class="stat-cell">0</span></td>
<td class="Table__TD"><span class="stat-cell">0</span></td>
<td class="Table__TD"><span class="stat-cell">1.000</span></td>
<td class="Table__TD"><span class="stat-cell">2-0</span></td>
<td class="Table__TD"><span class="stat-cell">4-0</span></td>
<td class="Table__TD"><span class="stat-cell">1-0</span></td>
<td class="Table__TD"><span class="stat-cell">3-0</span></td>
<td class="Table__TD"><span class="stat-cell">156</span></td>
<td class="Table__TD"><span class="stat-cell">64</span></td>
<td class="Table__TD"><span class="stat-cell clr-positive">+92</span></td>
<td class="Table__TD"><span class="stat-cell">W6</span></td>
</tr>
<tr class="filled Table__TR Table__TR--sm Table__even" data-idx="17">
<td class="Table__TD"><span class="stat-cell">5</span></td>
<td class="Table__TD"><span class="stat-cell">2</span></td>
<td class="Table__TD"><span class="stat-cell">0</span></td>
<td class="Table__TD"><span class="stat-cell">.714</span></td>
<td class="Table__TD"><span class="stat-cell">2-2</span></td>
<td class="Table__TD"><span class="stat-cell">3-0</span></td>
<td class="Table__TD"><span class="stat-cell">2-0</span></td>
<td class="Table__TD"><span class="stat-cell">2-1</span></td>
<td class="Table__TD"><span class="stat-cell">181</span></td>
<td class="Table__TD"><span class="stat-cell">176</span></td>
<td class="Table__TD"><span class="stat-cell clr-positive">+5</span></td>
<td class="Table__TD"><span class="stat-cell">L1</span></td>
</tr>
<tr class="Table__TR Table__TR--sm Table__even" data-idx="18">
<td class="Table__TD"><span class="stat-cell">4</span></td>
<td class="Table__TD"><span class="stat-cell">3</span></td>
<td class="Table__TD"><span class="stat-cell">0</span></td>
<td class="Table__TD"><span class="stat-cell">.571</span></td>
<td class="Table__TD"><span class="stat-cell">1-2</span></td>
<td class="Table__TD"><span class="stat-cell">3-1</span></td>
<td class="Table__TD"><span class="stat-cell">0-2</span></td>
<td class="Table__TD"><span class="stat-cell">3-3</span></td>
<td class="Table__TD"><span class="stat-cell">190</span></td>
<td class="Table__TD"><span class="stat-cell">164</span></td>
<td class="Table__TD"><span class="stat-cell clr-positive">+26</span></td>
<td class="Table__TD"><span class="stat-cell">W1</span></td>
</tr>
<tr class="no-border-bottom filled Table__TR Table__TR--sm Table__even" data-idx="19">
<td class="Table__TD"><span class="stat-cell">3</span></td>
<td class="Table__TD"><span class="stat-cell">3</span></td>
<td class="Table__TD"><span class="stat-cell">1</span></td>
<td class="Table__TD"><span class="stat-cell">.500</span></td>
<td class="Table__TD"><span class="stat-cell">1-2-1</span></td>
<td class="Table__TD"><span class="stat-cell">2-1</span></td>
<td class="Table__TD"><span class="stat-cell">0-1</span></td>
<td class="Table__TD"><span class="stat-cell">2-2-1</span></td>
<td class="Table__TD"><span class="stat-cell">161</span></td>
<td class="Table__TD"><span class="stat-cell">192</span></td>
<td class="Table__TD"><span class="stat-cell clr-negative">-31</span></td>
<td class="Table__TD"><span class="stat-cell">W3</span></td>
</tr>
=> nil
[18] pry(NflStandings::Standing)> puts doc.css("table:not(.Table--fixed-left)").css(".Table__TR").css("tr:not(.Table__sub-header)")[0]
<tr class="Table__TR Table__TR--sm Table__even" data-idx="1">
<td class="Table__TD"><span class="stat-cell">6</span></td>
<td class="Table__TD"><span class="stat-cell">0</span></td>
<td class="Table__TD"><span class="stat-cell">0</span></td>
<td class="Table__TD"><span class="stat-cell">1.000</span></td>
<td class="Table__TD"><span class="stat-cell">3-0</span></td>
<td class="Table__TD"><span class="stat-cell">3-0</span></td>
<td class="Table__TD"><span class="stat-cell">3-0</span></td>
<td class="Table__TD"><span class="stat-cell">4-0</span></td>
<td class="Table__TD"><span class="stat-cell">190</span></td>
<td class="Table__TD"><span class="stat-cell">48</span></td>
<td class="Table__TD"><span class="stat-cell clr-positive">+142</span></td>
<td class="Table__TD"><span class="stat-cell">W6</span></td>
</tr>
=> nil
[19] pry(NflStandings::Standing)> puts doc.css("table:not(.Table--fixed-left)").css(".Table__TR").css("tr:not(.Table__sub-header)")[2]
<tr class="Table__TR Table__TR--sm Table__even" data-idx="3">
<td class="Table__TD"><span class="stat-cell">1</span></td>
<td class="Table__TD"><span class="stat-cell">4</span></td>
<td class="Table__TD"><span class="stat-cell">0</span></td>
<td class="Table__TD"><span class="stat-cell">.200</span></td>
<td class="Table__TD"><span class="stat-cell">1-2</span></td>
<td class="Table__TD"><span class="stat-cell">0-2</span></td>
<td class="Table__TD"><span class="stat-cell">0-2</span></td>
<td class="Table__TD"><span class="stat-cell">0-3</span></td>
<td class="Table__TD"><span class="stat-cell">63</span></td>
<td class="Table__TD"><span class="stat-cell">123</span></td>
<td class="Table__TD"><span class="stat-cell clr-negative">-60</span></td>
<td class="Table__TD"><span class="stat-cell">W1</span></td>
</tr>
=> nil











//GIVES ME AN ARRAY OF EVERY TEAMS SCORES
scores(array) = doc.css("table:not(.Table--fixed-left)").css(".Table__TR").css("tr:not(.Table__sub-header)").map do |td| td.text end
//GIVES ME AN INDIVIDUAL TEAM'S SCORE
individual_scores = scores[0].split("")
//
["7",
 "0",
 "0",
 "1",
 ".",
 "0",
 "0",
 "0",
 "3",
 "-",
 "0",
 "4",
 "-",
 "0",
 "4",
 "-",
 "0",
 "5",
 "-",
 "0",
 "2",
 "2",
 "3",
 "4",
 "8",
 "+",
 "1",
 "7",
 "5",
 "W",
 "7"]

 [32] pry(NflStandings::Standing)> individual_scores[0]
=> "7"
[33] pry(NflStandings::Standing)> individual_scores[1]
=> "0"
[34] pry(NflStandings::Standing)> individual_scores[2]
=> "0"



def self.scrape_espn
  doc = Nokogiri::HTML(open("https://www.espn.com/nfl/standings"))

  standing = self.new
  standing.team_name = #doc.css(".ResponsiveTable").css(".hide-mobile").text
  #doc.css(".ResponsiveTable").css(".hide-mobile").css("a").first.text
  doc.css(".ResponsiveTable").css(".hide-mobile").css("a").map do |anchor| anchor.text end
  #standing.team_name.each do |team|
    #puts "#{team}"
  #end
  #standing.team_name.each {|n| @@standings << n.text.strip}
  #binding.pry
  standing.wins = doc.css(".Table__TD").css(".stat-cell")[0].text
  standing.losses = doc.css(".Table__TD").css(".stat-cell")[1].text
  standing.ties = doc.css(".Table__TD").css(".stat-cell")[2].text

  standing
end

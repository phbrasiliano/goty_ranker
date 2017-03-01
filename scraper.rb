require 'httparty'
require 'nokogiri'
require 'pry'
require 'csv'

pages = [HTTParty.get('http://www.gamerankings.com/browse.html?page=0&year=2016'), HTTParty.get('http://www.gamerankings.com/browse.html?page=1&year=2016')]

GAMES_DIC = {}

def complete_dic(page)
  parsed_content = Nokogiri::HTML(page).css('.pod')[0].css('tr').each do |game|
    game_name = game.css('td a').text.strip
    publisher = game.css('td')[2].text.split("\t")[2].split(",")[0]
    platform = game.css('td')[1].text.strip
    img = game.css('td img').map {|i| i['src']}

    if GAMES_DIC.key?(game_name)
      GAMES_DIC[game_name][:platform] << platform
    else
      GAMES_DIC[game_name] = {publisher: publisher, platform: [platform], img: img, game: game_name}
    end
  end
end

pages.each { |page| complete_dic(page)}

GAMES_DIC.each {|i| puts i}

binding.pry

puts "end of program"
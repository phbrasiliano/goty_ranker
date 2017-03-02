require 'sinatra'
require 'sinatra/reloader'
require './sorter.rb'

GAME_DIC = File.open("./files/games.marshal", "r"){ |file| Marshal.load(file)}
final_list = []

get '/' do
  game1 = GAME_DIC[0]
  game2 = GAME_DIC[1]
  erb(:index, :locals => {game1: game1, game2: game2})
end
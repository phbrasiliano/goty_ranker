require 'sinatra'
require 'sinatra/reloader'
require './sorter.rb'

GAME_DIC = File.open("./files/games.marshal", "r"){ |file| Marshal.load(file)}
final_list = []

get '/' do
  message = 'this is the message'
  erb(:index, :locals => {message: message})
end
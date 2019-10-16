require 'sinatra'
require 'sinatra/reloader'

secret = rand(101)

get '/' do
  "Random number is: #{secret}"
end
require 'sinatra'
require 'sinatra/reloader'

NUMBER = rand(100)+1

def check_guess(input_guess)
    if !input_guess || input_guess == ""
        return ""
    else
        input_guess = input_guess.to_i
    end
    if input_guess == NUMBER
        return "Correct! The secret number is #{NUMBER}"
    elsif input_guess < NUMBER-5
        return "Way too low!"
    elsif input_guess < NUMBER
        return "Too low!"
    elsif input_guess > NUMBER+5
        return "Way too high!"
    elsif input_guess > NUMBER
        return "Too high!"
    else
        return ""
    end
end

get '/' do
    guess = params["guess"]
    message = check_guess(guess)
    erb :index, :locals => {:number => NUMBER, :message => message}
end
require 'sinatra'
require 'sinatra/reloader'

NUMBER = rand(100)+1
color = 

def difference(input)
    return input - NUMBER
end
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
def change_color(input_diff)
    if input_diff > 9 || input_diff < -9
        return "red"
    elsif input_diff > 0 || input_diff < 0
        return "pink"
    elsif input_diff == 0
        return "green"
    else
        return "white"
    end
end

get '/' do
    guess = params["guess"].to_i
    diff = difference(guess)
    message = check_guess(guess)
    color = change_color(diff)
    erb :index, :locals => {:number => NUMBER, :message => message, :color => color}
end
require 'sinatra'
require 'sinatra/reloader'

@@number = rand(100)+1
color = "white"
guess_count = 6

def difference(input, number)
    return input - number
end
def check_guess(input_guess, number)
    if !input_guess || input_guess == ""
        return ""
    else
        input_guess = input_guess.to_i
    end
    if input_guess == number
        return "Correct! The secret number is #{number}"
    elsif input_guess < number-5
        return "Way too low!"
    elsif input_guess < number
        return "Too low!"
    elsif input_guess > number+5
        return "Way too high!"
    elsif input_guess > number
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
def guess_counter(input_count, input_operation)
    if input_count < 1
        @@number = rand(100)+1
        return 5
    end
    return input_count + input_operation
end

get '/' do
    guess = params["guess"].to_i
    cheat = params["cheat"]
    guess_count = guess_counter(guess_count,-1)
    diff = difference(guess, @@number)
    message = check_guess(guess, @@number)
    color = change_color(diff)
    erb :index, :locals => {
        :number => @@number, 
        :message => message, 
        :color => color, 
        :guess_count => guess_count, 
        :cheat => cheat
    }
end
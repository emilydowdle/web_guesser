require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

def check_guess(guess)
  if params["guess"].to_i / 5 > SECRET_NUMBER
    "Way too high!"
  elsif params["guess"].to_i * 5 < SECRET_NUMBER
    "Way too low!"
  elsif params["guess"].to_i > SECRET_NUMBER
    "Too high!"
  elsif params["guess"].to_i < SECRET_NUMBER
    "Too low!"
  else
    "Your guess is correct!\nThe secret number is #{SECRET_NUMBER}"
  end
end

get '/' do
  guess = params["guess"]
  message = check_guess(guess)
  erb :index, :locals => {:num => SECRET_NUMBER, :message => message}

end

require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

def set_style(message)
  if message == ""
    "white"
  elsif message == "Way too high!"|| message == "Way too low!"
    "red"
  elsif message == "Too high!" || message == "Too low!"
    "pink"
  else
    "green"
  end
end

def check_guess(guess)
  if params["guess"].nil?
    ""
  elsif params["guess"].to_i / 5 > SECRET_NUMBER
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
  style = set_style(message)
  erb :index, :locals => {:num => SECRET_NUMBER, :message => message, :style => style}
end

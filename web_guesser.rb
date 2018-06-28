require 'sinatra'
require 'sinatra/reloader'

	SECRET_NUMBER = rand(101)

	

get '/' do 
	guess = params['guess']
	message = check_guess(guess)
	erb :index, :locals => {:message => message}

	
end


def check_guess(guess)
	guess_no = guess.to_i
	if guess_no > SECRET_NUMBER
		guess_no - SECRET_NUMBER > 5 ? "Way too high." : "Too high."
	elsif guess_no < SECRET_NUMBER
	 SECRET_NUMBER - guess_no > 5 ? "Way too low" : "Too  low!"
	else guess_no == SECRET_NUMBER	
		return "Correct! The secret SECRET_NUMBER was #{SECRET_NUMBER}"
	end	
	
end
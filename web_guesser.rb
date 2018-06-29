require 'sinatra'
require 'sinatra/reloader'

	SECRET_NUMBER = rand(101)

	

get '/' do 
	guess = params['guess']
	message = check_guess(guess)
	color = get_color(guess)
	erb :index, :locals => {:message => message, :color => color}

	
end


def check_guess(guess)
	guess_no = guess.to_i
	if guess_no > SECRET_NUMBER
		guess_no - SECRET_NUMBER > 5 ? "Way too high." : "Too high."
	elsif guess_no < SECRET_NUMBER
	 SECRET_NUMBER - guess_no > 5 ? "Way too low" : "Too  low!"
	else guess_no == SECRET_NUMBER	
		return "Correct! The secret number was #{SECRET_NUMBER}"
	end	
	
end

def get_color(guess)
	guess_int =  guess.to_i
	diff = (SECRET_NUMBER - guess_int).abs

	if diff > 5 
		return "Red"
	elsif diff == 0 
		return "Green"
	elsif diff < 5
	 return "LightPink"
	end 
	
end

#do extensions
require 'sinatra'
require 'sinatra/reloader'

	@@guess_count = 0
	SECRET_NUMBER = rand(101)

	

get '/' do 
	guess = params['guess']
	count = @@guess_count += 1
	process_guess(guess)
	diff = check_diff(guess)
	message = check_guess(diff)
	color = get_color(diff)

	erb :index, :locals => {:message => message, :color => color, :count => count}

	
end

def process_guess(guess)
	
end


def check_diff(guess)
	guess_int = guess.to_i
	diff = (SECRET_NUMBER - guess_int)
	return diff
end

def check_guess(diff)
	case diff

	when -5..-1
		"To high"
	when 1..5
		"Too Low"
	when 0
			"Correct! The secret number was #{SECRET_NUMBER}"
	else
		if diff < -5 
			"Way too high"
	 	elsif diff > 5
	 		"Way too low"
	 	end	
	end					
	
end

def get_color(diff)

	true_diff = diff.abs 
	
	if true_diff > 5 
		return "Red"
	elsif true_diff == 0 
		return "Green"
	elsif true_diff < 5
	 return "LightPink"
	end 
	
end

#do extensions
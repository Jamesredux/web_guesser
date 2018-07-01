require 'sinatra'
require 'sinatra/reloader'


	
	@@secret_number  = rand(101)
	@@guess_count = 0


get '/' do 
	guess = params['guess']
	cheat = params['cheat']
	if cheat == 'true'
		@message = "The code is #{@@secret_number}"
	else	
		process_guess(guess)
	end

	erb :index, :locals => {:message => @message, :color => @color}

	
end



def process_guess(guess)

	@@guess_count += 1
	diff = check_diff(guess)
	@message = check_guess(diff)
	if diff == 0 || @@guess_count > 5  
		new_game
	end	
end

def new_game
	@@secret_number  = rand(101)
	@@guess_count = 0
end


def check_diff(guess)
	guess_int = guess.to_i
	diff = (@@secret_number - guess_int)
  diff
end

def check_guess(diff)
	@color = get_color(diff)
	if diff == 0 
		"Correct! The secret number was #{@@secret_number}. A new number has been generated"
	elsif @@guess_count > 5
		"GAME OVER. You ran out of guesses. The number was #{@@secret_number} Please try again, a new number has been generated."
	else
		if diff > 5
			"Way too low!"
		elsif diff < -5
			"Way too high!"
		elsif diff > 0 
			"Too low"
		else
			"Too high"
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



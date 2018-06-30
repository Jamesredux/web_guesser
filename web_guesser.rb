require 'sinatra'
require 'sinatra/reloader'


	
	@@secret_number  = rand(101)
	@@guessed = false
	@@guess_count = 0


get '/' do 
	guess = params['guess']
	process_guess(guess)
	

	erb :index, :locals => {:message => @message, :color => @color, :count => @@guess_count, :number => @@secret_number}

	
end



def process_guess(guess)
	@@guess_count += 1

	diff = check_diff(guess)
	@message = check_guess(diff)
	@color = get_color(diff)
	if @@guess_count > 3
		new_game
	end	
	
end

def new_game
	@@secret_number  = rand(101)
	@@guessed = false
	@@guess_count = 0

	
end


def check_diff(guess)
	guess_int = guess.to_i
	diff = (@@secret_number - guess_int)
	return diff
end

def check_guess(diff)
	case diff

	when -5..-1
		"To high"
	when 1..5
		"Too Low"
	when 0
			"Correct! The secret number was #{@@secret_number}"
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



game = Game.new


#currently on new branch testing guess count and a way to end game
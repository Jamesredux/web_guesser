require 'sinatra'
require 'sinatra/reloader'
	ran_num = rand(101)
get '/' do 
	
	"The secret number is #{ran_num}."
	
end



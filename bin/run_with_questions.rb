require_relative '../config/environment'
require 'tty-prompt'



def main

	ActiveRecord::Base.logger.level = 1
	prompt = TTY::Prompt.new
	welcome

	while true

		
		
		a = BookQuestion.new.ask_question(prompt)


 		answer = prompt.select("Do you wanna try another time?", %w(Yes No))

 		if answer == "No"
 			puts a
   			puts "Goodbye!"
   			return
 		end
	 # if answer == num.to_s
	 #   puts "You guessed the correct number!"

	 # end
	 # if answer != num.to_s
	 #   puts "The computer guessed #{num}."
	 # end

	end #while end

end

main
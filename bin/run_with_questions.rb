require_relative '../config/environment'
require 'tty-prompt'



def main

	ActiveRecord::Base.logger.level = 1
	prompt = TTY::Prompt.new
	welcome

	while true

		questions_array = []
		answers_array = []

		5.times do |i|
			questions_array << BookQuestion.new
			questions_array << CharacterAppearanceQuestion.new
			
		end

		questions_array.each do |q|
			answers_array << q.ask_question(prompt)
		end

		puts
 		answer = prompt.select("Do you wanna try another time?", %w(Yes No))

 		if answer == "No"
 			puts "Your answers were " + answers_array.inspect
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
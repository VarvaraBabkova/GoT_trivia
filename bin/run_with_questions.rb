require_relative '../config/environment'
require 'tty-prompt'



def main

	ActiveRecord::Base.logger.level = 1
	prompt = TTY::Prompt.new


	welcome

	while true

		number_of_questions_in_quiz = 5
		questions_type = [BookQuestion, CharacterAppearanceQuestion]
		account = 10

		questions_array = []
		answers_array = []

		#randomly forming array of questions
		number_of_questions_in_quiz.times do |i|
			questions_array << questions_type[rand(questions_type.size)].new
		end

		#actually asking
		questions_array.each do |q|
			bet = make_a_bet(prompt, account)
			puts "Your bet is " + bet.to_s

			account -= bet

			answers_array << q.ask_question(prompt)

			account += bet*2 if answers_array.last
			puts "Your account is " + account.to_s
		end

		puts
		puts "Your answered " + answers_array.count(true).to_s + " times correctly out of " + number_of_questions_in_quiz.to_s

 		answer = prompt.select("Do you wanna try another time?", %w(Yes No))

 		if answer == "No"
   			puts "Goodbye!"
   			return
 		end
	 

	end #while end

end

main
require_relative '../config/environment'
require 'tty-prompt'
ActiveRecord::Base.logger.level = 1


def main

	prompt = TTY::Prompt.new

	draw_dragon	

	welcome

	while true

		number_of_questions_in_quiz = 10
		initial_account = 10
		questions_type = [BookQuestion, CharacterAppearanceQuestion, CharacterCultureQuestion, 
			CharacterGenderQuestion, CharacterSpouseQuestion]
		account = initial_account

		questions_array = []
		answers_array = []

		bar = bar_init(number_of_questions_in_quiz)


		#randomly forming array of questions
		number_of_questions_in_quiz.times do |i|
			questions_array << questions_type.sample.new
		end

		#actually asking
		questions_array.each do |q|


			if (account == 0) 
				puts "You have nothing to play with!"
				break
			end

			puts 
			bar.advance(1)

			bet = make_a_bet(prompt, account)
			
			account -= bet

			answers_array << q.ask_question(prompt)

			account += bet*2 if answers_array.last
			puts "Your account is " + account.to_s + " now."
		end


		#the end of question set
		puts
		if (account > initial_account)
				puts "Your account is " + account.to_s + " and you gained " + ( - initial_account + account).to_s + " Gold Dragon coins!"
			else
				puts "Your account is " + account.to_s
			end

		puts "Your answered " + answers_array.count(true).to_s + " times correctly out of " + number_of_questions_in_quiz.to_s
		
 		answer = prompt.select("Do you wanna try another round?", %w(No Yes))

 		if answer == "No"
   			puts "Goodbye!"
   			return
 		end
	 

	end #while end

end

main
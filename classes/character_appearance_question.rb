require_relative "question.rb"

class CharacterAppearanceQuestion < Question
	def ask_question(prompt)
		random_id = rand(Character.last.id - Character.first.id) + Character.first.id
		answer2 = prompt.select("How many books does #{Character.name_by_id(random_id)} appear in?", [Character.how_many_books_character_appeares_in(random_id), 4, 6, 8])
	    if answer2 == Character.how_many_books_character_appeares_in(random_id)
	        puts "Correct " + Character.how_many_books_character_appeares_in(random_id).to_s
	        return true
	    else
	        puts "Your answer was not correct. Here is the right answer " + Character.how_many_books_character_appeares_in(random_id).to_s
	        return false
	    end
	end
end
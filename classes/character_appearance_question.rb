require_relative "question.rb"

class CharacterAppearanceQuestion < Question
	def ask_question(prompt)
		arr = [1,2,3,4,5,6,7,8,9]
	    random_id = rand(Character.last.id - Character.first.id) + Character.first.id
	    correct_ans = Character.how_many_books_character_appeares_in(random_id)
	    ans = [correct_ans]
	    num = 0
	    while num < 4
	        i=rand(arr.length)
	        if !ans.include? (arr[i])
	            ans << arr[i]
	            num += 1
	        end
	    end

	    answer2 = prompt.select("How many books does #{Character.name_by_id(random_id)} appear in?", ans.shuffle)
	    if answer2 == Character.how_many_books_character_appeares_in(random_id)
	        correct_answer("Correct " + Character.how_many_books_character_appeares_in(random_id).to_s)
	        return true
	    else
	        not_correct_answer("Your answer was not correct. Here is the right answer " + Character.how_many_books_character_appeares_in(random_id).to_s)
	        return false

	    end
	end
end
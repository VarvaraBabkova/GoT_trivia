require_relative '../config/environment'
require 'tty-prompt'
ActiveRecord::Base.logger.level = 1
prompt = TTY::Prompt.new

def q4(prompt)
    random_id = rand(Character.last.id - Character.first.id) + Character.first.id
    character = Character.name_by_id(random_id)
    correct_ans = Character.which_gender_character_is(random_id)
    incorrect_ans = ""	
    # binding.pry
    if correct_ans == "Male"
        incorrect_ans = "Female"
    else
        incorrect_ans = "Male"
    end
    ans = [correct_ans, incorrect_ans]

    answer4 = prompt.select("Which gender is #{Character.name_by_id(random_id)}?", ans.shuffle)
    if answer4.downcase == correct_ans.downcase
        puts "Correct"
    else
        puts "Your answer was not correct. Here is the right answer "+ correct_ans
    end
end
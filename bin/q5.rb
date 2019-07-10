def q5(prompt)
    c_ids = Character.characters_that_has_spouses
    random_id = c_ids[rand(c_ids.length)]
    correct_ans = Character.character_spouse_name(random_id)
    
    female_characters = c_ids.select do |character|
        Character.which_gender_character_is(character) != "Male"
    end

    male_characters=c_ids.select do |character|
        Character.which_gender_character_is(character) == "Male"
    end

    number_of_characters = 0
    chosen_characters = []
    
    if Character.which_gender_character_is(random_id) == "Male"
        while (number_of_characters < 4)
            c = female_characters.sample
            chosen_characters << Character.find(c).name
            number_of_characters += 1
        end
    else
        while (number_of_characters < 4)
            c = male_characters.sample
            chosen_characters << Character.find(c).name
            number_of_characters += 1
        end
    end

    ans = [correct_ans]
    ans << chosen_characters
    ans.flatten!
    ans.slice(0, 5)

    answer5 = prompt.select("Who is #{Character.name_by_id(random_id)}'s spouce?", ans.shuffle)
    if answer5.downcase == correct_ans.downcase
        puts "Correct"
    else
        puts "Your answer was not correct. Here is the right answer "+ correct_ans
    end
end


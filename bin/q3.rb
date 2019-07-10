def q3(prompt)
    c_ids = Character.characters_that_has_culture
    random_id2 = c_ids[rand(c_ids.length)]
    correct_ans = Character.which_culture_character_is(random_id2)

    ans = [correct_ans]
    num = 0
    while num < 4
        i=rand(Character.all_cultures.length)
        if !ans.include? (Character.all_cultures[i])
            ans << Character.all_cultures[i]
            num += 1
        end
    end

    answer3 = prompt.select("Which culture/background does #{Character.name_by_id(random_id2)} belong to?", ans.shuffle)
    if answer3 == Character.which_culture_character_is(random_id2)
        puts "Correct " + Character.which_culture_character_is(random_id2)
    else
        puts "Your answer was not correct. Here is the right answer "+ Character.which_culture_character_is(random_id2)
    end
end
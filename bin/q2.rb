def q2(prompt)
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
        puts "Correct " + Character.how_many_books_character_appeares_in(random_id).to_s
    else
        puts "Your answer was not correct. Here is the right answer " + Character.how_many_books_character_appeares_in(random_id).to_s
    end
end
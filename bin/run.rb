require_relative '../config/environment'
require 'tty-prompt'
ActiveRecord::Base.logger.level = 1
prompt = TTY::Prompt.new

def welcome
    puts "W E L C O M E   T O"
    font = TTY::Font.new(:standard)
    pastel = Pastel.new
    puts pastel.yellow(font.write("GOT Trivia"))
  
end

def clear_logs
    system "clear"
end

def make_a_range(pages, number_of_choices, step = 100)
    r = rand(number_of_choices) + 1
    pages_floor = (pages/step).floor

    if pages_floor < number_of_choices
        puts "pages " + pages.to_s + ", floor " + pages_floor.to_s + ", step " + step.to_s +
        ", random place " + r.to_s + " in " + number_of_choices.to_s + " choices"
        return ["With this step and this amount of pages we don't have so many choices..",
            "please choose different step"]
    end

    pages_floor *= step

    ar =  []
    i = 1
    number_of_choices.times do
        limit_floor = pages_floor - (r - i)*step


        limit_ceil = limit_floor + step - 1
        ar << limit_floor.to_s + " to " + limit_ceil.to_s
        i += 1
    end
    return ar
end




def q1(prompt)
    rand_book = rand(10) + 1
    ar = make_a_range(Book.number_of_pages(rand_book), 5, 20)
    answer1 = prompt.select("How many pages are in book #{Book.book_name(rand_book)}?") do |menu|
        menu.choices ar
    end
    if answer1.split[0].to_i <= Book.number_of_pages(rand_book) and answer1.split[2].to_i > Book.number_of_pages(rand_book)
        puts "Correct " + Book.number_of_pages(rand_book).to_s
    else
        puts "Your answer was not correct. Here is the right answer " + Book.number_of_pages(rand_book).to_s
    end
end



def q2(prompt)
    random_id = rand(Character.last.id - Character.first.id) + Character.first.id
    answer2 = prompt.select("How many books does #{Character.name_by_id(random_id)} appear in?", [Character.how_many_books_character_appeares_in(random_id), 4, 6, 8])
    if answer2 == Character.how_many_books_character_appeares_in(random_id)
        puts "Correct " + Character.how_many_books_character_appeares_in(random_id).to_s
    else
        puts "Your answer was not correct. Here is the right answer " + Character.how_many_books_character_appeares_in(random_id).to_s
    end
end

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

    # binding.pry

    answer3 = prompt.select("Which culture/background does #{Character.name_by_id(random_id2)} belong to?", ans.shuffle)
    if answer3 == Character.which_culture_character_is(random_id2)
        puts "Correct " + Character.which_culture_character_is(random_id2)
    else
        puts "Yours answer was not correct. Here is the right answer "+ Character.which_culture_character_is(random_id2)
    end
end



welcome
q1(prompt)
q2(prompt)
q3(prompt)

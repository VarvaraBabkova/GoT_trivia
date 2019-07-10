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
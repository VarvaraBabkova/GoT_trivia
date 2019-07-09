require_relative '../config/environment'
require 'tty-prompt'
ActiveRecord::Base.logger.level = 1
prompt = TTY::Prompt.new

def welcome
    puts "W E L C O M E   T O"
    font = TTY::Font.new(:standard)
    pastel = Pastel.new
    puts pastel.yellow(font.write("GOT Trivia"))
    #puts font.write("GOT Trivia)
    puts



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

rand_book = Book.number_of_pages(rand(10) + 1)

def q1(prompt, rand_book)
    ar = make_a_range(rand_book, 5, 20)
    prompt.select("How many pages are in book #{rand_book}") do |menu|
        menu.choices ar
    end
end



welcome
q1(prompt, rand_book)
require_relative '../config/environment'
require 'tty-prompt'
ActiveRecord::Base.logger.level = 1
$prompt = TTY::Prompt.new
$pastel = Pastel.new



def welcome
    puts "W E L C O M E   T O"
    font = TTY::Font.new(:standard)
    puts $pastel.yellow(font.write("GOT Trivia"))
    puts $pastel.red("When you play the game of thrones, you win or you die. There is no middle ground.")

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
    
    
    rand_book = rand(10) + 1
    def q1(prompt, rand_book)
        ar = make_a_range(Book.number_of_pages(rand_book), 5, 20)
        answer1 = prompt.select("How many pages are in book #{Book.book_name(rand_book)}") do |menu|
            menu.choices ar
        end
        if answer1.split[0].to_i <= Book.number_of_pages(rand_book) and answer1.split[2].to_i > Book.number_of_pages(rand_book)
            puts "Correct " + Book.number_of_pages(rand_book).to_s
        else
            puts "Your answer was not correct. Here is the right answer " + Book.number_of_pages(rand_book).to_s
            wrong_answer
        end
    end
    
    def clear_log
        system "clear"
    end 

    def wrong_answer
        oh_no = $prompt.yes?("Your DEAD! Would you Like to play again?")
        if oh_no == true
            welcome
        else
            puts "When you play the game of thrones, you win or you die. There is no middle ground."

            sleep(10)
            exit!
        end
    end

# how_many_books_character_appeares_in(id)
# def q2(prompt)
#     ar2 = 
#     answer2 = prompt.select("How many books does this character appear in")
# end


welcome

q1($prompt, rand_book)
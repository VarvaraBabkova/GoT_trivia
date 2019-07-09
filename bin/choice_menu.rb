require_relative '../config/environment'
require 'tty-prompt'
prompt = TTY::Prompt.new

q1input=Book.number_of_pages(3)
# puts Character.how_many_books_character_appeares_in(200)
# puts Character.which_culture_character_is(100)
# puts Character.which_gender_character_is(100)

# puts Character.characters_that_has_mothers.inspect
# puts Character.characters_that_has_fathers.inspect
# puts Character.characters_that_has_spouses.inspect

# puts Character.character_mother_name(100)
# puts Character.character_father_name(100)
# puts Character.character_spouse_name(100)

def clear_logs
   system "clear"
end

def got_nerd
   puts "Lets begin your conquest on GoT trivia .. "
end

# def q1(prompt)
#     answer = prompt.yes?('Do you like Ruby?')
#     if answer == true
#         puts "good job"
#     else
#         puts "you suck"
#     end
# end


# def q1(prompt, book.id)
#     ans1 = "#{(book.numberOfPages)-150} to #{(book.numberOfPages)-51}"
#     ans2 = "#{(book.numberOfPages)-50} to #{(book.numberOfPages)+50}"
#     ans3 = "#{(book.numberOfPages)+51} to #{(book.numberOfPages)+150}"


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

	puts pages.to_s + " " + pages_floor.to_s + " " + r.to_s

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




def q1(prompt, pages)

	ar = make_a_range(pages, 5, step = 100)
	
    prompt.select("What size?") do |menu|
  		menu.choices  ar

	end
end





# call questions down here
clear_logs
got_nerd
q1(prompt, rand(1500) + 1)


#binding.pry


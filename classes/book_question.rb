
require_relative "question.rb"

class BookQuestion < Question

	def ask_question(prompt)
		rand_book = rand(10) + 1
		ar = make_a_range(Book.number_of_pages(rand_book), 5, 20)

	    answer1 = prompt.select("How many pages are in book #{Book.book_name(rand_book)}") do |menu|
	     	menu.choices ar
	    end

	    if answer1.split[0].to_i <= Book.number_of_pages(rand_book) and answer1.split[2].to_i > Book.number_of_pages(rand_book)
	        puts "Correct " + Book.number_of_pages(rand_book).to_s
	        return true
	    else
	        puts "Your answer was not correct. Here is the right answer " + Book.number_of_pages(rand_book).to_s
	        return false
	 	end
	end

end
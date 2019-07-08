def read_characters_page_from_file(page_num)

	f = File.open("data/characters_" + page_num.to_s + ".txt")
  	response_hash = JSON.parse(f.read)
  	f.close

	puts "Here are the characters:"
  	response_hash.each do |ch|
  		Character.create(url: ch["url"], name: ch["name"], gender: ch["gender"], 
  			culture: ch["culture"], born: ch["born"], died: ch["died"], 
  			mother: ch["mother"], father: ch["father"], spouse:ch["spouse"])

  		#puts " " + ch["name"]

 	 end
end

def fill_all_pages
	i = 1
	while i <= 43 do
		read_characters_page_from_file(i)
		puts "filled " + i.to_s + "/43"
		i += 1
	end
end

def fill_books_from_file
	f = File.open("data/books.txt")
  	response_hash = JSON.parse(f.read)
  	f.close

	puts "Here are the Books:"
	response_hash.each do |book|
		Book.create(url: book["url"], name: book["name"], numberOfPages: book["numberOfPages"])
		puts " " + book["name"]

	end
end


Character.destroy_all
Book.destroy_all

fill_all_pages
fill_books_from_file
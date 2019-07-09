#reading files ../data/characters_XX.txt-------------------------

def fill_characters_from_file_one_page(page_num)

	f = File.open("data/characters_" + page_num.to_s + ".txt")
  	response_hash = JSON.parse(f.read)
  	f.close

	puts "Here are the characters:"
  	response_hash.each do |ch|
  		character = Character.create(url: ch["url"], name: ch["name"], gender: ch["gender"], 
  			culture: ch["culture"], born: ch["born"], died: ch["died"], 
  			mother: ch["mother"], father: ch["father"], spouse:ch["spouse"])


  		#filling joint table------------------------------------

  		#id_arr = []
  		ch["books"].each do |b|
  			#id_arr << Book.find_by(url: b).id if Book.find_by(url: b)
  			if Book.find_by(url: b)	
  				Appearance.create(book_id: Book.find_by(url: b).id, character_id:character.id)
  			end
  		end
 	 end
end

def fill_characters_from_file_all_pages
	i = 1
	while i <= 43 do
		fill_characters_from_file_one_page(i)
		puts "filled " + i.to_s + "/43"
		i += 1
	end
end

#reading file ../data/books.txt-----------------------------------------

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

#cleaning tables before seeding

Appearance.destroy_all
Character.destroy_all
Book.destroy_all 

#seeding

fill_books_from_file
fill_characters_from_file_all_pages 
#fill_characters_from_file_one_page(1)

require 'rest-client'
require 'json'
require 'pry'

def show_books
	f = File.open("books.txt")
  response_hash = JSON.parse(f.read)

puts "Here are the books:"
  response_hash.each do |book|
   # puts " " + book["name"].to_s
  	puts " " + book["name"]
  end
end

def read_books_to_file
	File.write("books.txt", RestClient.get('https://www.anapioficeandfire.com/api/books'))
end

def read_characters_to_file

	i = 1
	while i <= 43 do

		filename = "characters_" + i.to_s + ".txt"
		urlstr = 'https://www.anapioficeandfire.com/api/characters?page=' + i.to_s + '&pageSize=50'
		File.write(filename, RestClient.get(urlstr))
		i += 1
			
	end	
	
end

def show_characters

	f = File.open("characters_40.txt")
  	response_hash = JSON.parse(f.read)
  	f.close

	puts "Here are the characters:"
  	response_hash.each do |ch|
   # puts " " + book["name"].to_s
  	puts " " + ch["name"]
  end
end


#read_books_to_file
show_books
#read_characters_to_file
show_characters

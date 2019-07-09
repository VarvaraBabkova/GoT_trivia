require_relative '../config/environment'
ActiveRecord::Base.logger.level = 1


#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#Here is a list of methods available:
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#Book.number_of_pages(num)  takes num between 1 and 10, returns number of pages

# Character.name_by_id(random_id)						        takes character id, returns his name
# Character.how_many_books_character_appeares_in(random_id)		takes character id, returns number of books he appeares in
# Character.which_culture_character_is(random_id)				takes character id, returns his culture
# Character.which_gender_character_is(random_id)				takes character id, returns his gender

# Character.characters_that_has_mothers  returns array of ids of characters with info about mother
# Character.characters_that_has_fathers  returns array of ids of characters with info about father
# Character.characters_that_has_spouses	 returns array of ids of characters with info about spouse

# Character.character_mother_name(character_id)  takes characters id, returns his mother's name
# Character.character_father_name(character_id)  takes characters id, returns his father's name
# Character.character_spouse_name(character_id)  takes characters id, returns his spouse's name
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++



i = 0
12.times do
	#all ten book pages 
	puts Book.number_of_pages(i)
	puts Book.book_name(i)
	i += 1

	#random character id
	random_id = rand(Character.last.id - Character.first.id) + Character.first.id

	#info about this random id
	puts Character.name_by_id(random_id)
	puts Character.how_many_books_character_appeares_in(random_id)
	puts Character.which_culture_character_is(random_id)
	puts Character.which_gender_character_is(random_id)	

	puts

end

#arrays of characters with info of mothers fathers and spouses
m_ids = Character.characters_that_has_mothers
puts m_ids.inspect
puts "total mothers " + m_ids.size.to_s

f_ids = Character.characters_that_has_fathers
puts f_ids.inspect
puts "total fathers " + f_ids.size.to_s

s_ids = Character.characters_that_has_spouses
puts s_ids.inspect
puts "total spouses " + s_ids.size.to_s

#info of random characters mother father or spouses 
10.times do 
	r_m = rand(m_ids.size) 
	puts Character.name_by_id(m_ids[r_m]) + " mother: " + Character.character_mother_name(m_ids[r_m])

	r_f = rand(f_ids.size) 
	puts Character.name_by_id(f_ids[r_f]) + " father: " + Character.character_father_name(f_ids[r_f])

	r_s = rand(s_ids.size) 
	puts Character.name_by_id(s_ids[r_s]) + " spouse: " + Character.character_spouse_name(s_ids[r_s])

	puts
end

puts "HELLO WORLD"

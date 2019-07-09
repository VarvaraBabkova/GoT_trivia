require_relative '../config/environment'


#binding.pry

puts Book.number_of_pages(3)
puts Character.how_many_books_character_appeares_in(200)
puts Character.which_culture_character_is(100)
puts Character.which_gender_character_is(100)

puts Character.characters_that_has_mothers.inspect
puts Character.characters_that_has_fathers.inspect
puts Character.characters_that_has_spouses.inspect

puts Character.character_mother_name(100)
puts Character.character_father_name(100)
puts Character.character_spouse_name(100)


puts "HELLO WORLD"

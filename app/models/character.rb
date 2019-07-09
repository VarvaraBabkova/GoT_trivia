class Character < ActiveRecord::Base
    has_many :appearances
    has_many :books, through: :appearances


    def self.how_many_books_character_appeares_in(id)
    	return 1
    end

    def self.which_culture_character_is(id)
    	return "Northmen"
    end

    def self.which_gender_character_is(id)
    	return "Male"
    end

	def self.characters_that_has_mothers()
		ar_of_ids = [200, 300]
    	return ar_of_ids
    end

    def self.characters_that_has_fathers()
		ar_of_ids = [200, 300]
    	return ar_of_ids
    end

    def self.characters_that_has_spouses()
		ar_of_ids = [200, 300]
    	return ar_of_ids
    end

    def self.character_mother_name(id)
    	mother_name = "Mother nature"
    	return mother_name
    end

     def self.character_father_name(id)
     	father_name = "God or something"
    	return father_name
    end

     def self.character_spouse_name(id)
     	spouse_name = "Second half one in a million"
    	return spouse_name
    end

end
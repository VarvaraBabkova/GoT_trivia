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

	def self.does_characters_has_mother()
		ar_of_ids = []
    	return ar_of_ids
    end

    def self.does_characters_has_father()
		ar_of_ids = []
    	return ar_of_ids
    end

    def self.does_characters_has_spouse()
		ar_of_ids = []
    	return ar_of_ids
    end

    def self.characters_mother_name(id)
    	mother_name = "Mother nature"
    	return mother_name
    end

     def self.characters_father_name(id)
     	father_name = "God or something"
    	return father_name
    end

     def self.characters_spouse_name(id)
     	spouse = "Second half one in a million"
    	return spouse
    end

end
class Character < ActiveRecord::Base
    has_many :appearances
    has_many :books, through: :appearances

    def self.name_by_id(id)
    	return nil if !Character.find(id)
    	return Character.find(id).name
    end

    def self.name_by_url(url)
    	return nil if !Character.find_by(url: url)
    	return Character.find_by(url: url).name
    end

    def self.how_many_books_character_appeares_in(id)
    	return nil if !Character.find(id)
    	return Character.find(id).books.count
    end

    def self.which_culture_character_is(id)
		return nil if !Character.find(id)
    	return Character.find(id).culture   
    end

    def self.which_gender_character_is(id)
		return nil if !Character.find(id)
    	return Character.find(id).gender       
    end

    def self.all_cultures
        ar = []
         Character.select(:culture).distinct.each do |c|
            if c.culture != ""
                ar << c.culture
            end
         end
         return ar
    end

    def self.characters_that_has_culture()
        ar_of_ids = []
        Character.where("culture != ''").find_each do |c|
            ar_of_ids << c.id
        end
        return ar_of_ids
    end

	def self.characters_that_has_mothers()
		ar_of_ids = []
		Character.where("mother != ''").find_each do |c|
			ar_of_ids << c.id
		end
    	return ar_of_ids
    end

    def self.characters_that_has_fathers()
		ar_of_ids = []
		Character.where("father != ''").find_each do |c|
			ar_of_ids << c.id
		end
    	return ar_of_ids
    end

    def self.characters_that_has_spouses()
		ar_of_ids = []
		Character.where("spouse != ''").find_each do |c|
			ar_of_ids << c.id
		end
    	return ar_of_ids
    end

    def self.character_mother_name(id)
    	return nil if !Character.find(id)
    	return name_by_url(Character.find(id).mother) 
    end

     def self.character_father_name(id)
     	return nil if !Character.find(id)
    	return name_by_url(Character.find(id).father) 
    end

     def self.character_spouse_name(id)
     	return nil if !Character.find(id)
    	return name_by_url(Character.find(id).spouse) 
    end

end
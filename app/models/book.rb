class Book < ActiveRecord::Base
    has_many :appearances
    has_many :characters, through: :appearances

    def self.number_of_pages(num)
    	return 100
    end

    
end
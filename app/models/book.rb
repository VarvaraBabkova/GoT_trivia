class Book < ActiveRecord::Base
    has_many :appearances
    has_many :characters, through: :appearances

    def self.number_of_pages(num)
    	return Book.find_by(url: "https://www.anapioficeandfire.com/api/books/" + num.to_s).numberOfPages
    end


end
class Character < ActiveRecord::Base
    has_many :appearances
    has_many :books, through: :appearances
end
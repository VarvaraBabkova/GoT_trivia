class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :url
      t.string :name
      t.string :gender
      t.string :culture
      t.string :born
      t.string :died
      # t.string :titles
      # t.string :aliases
      t.string :father
      t.string :mother
      t.string :spouse
      # t.string :allegiances
      # t.string :books
      # t.string :povBooks
      # t.string :tvSeries
      # t.string :playedBy
    end
  end
end

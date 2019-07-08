class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :url
      t.string :name
      # t.string :isbn
      # t.string :authors
      t.integer :numberOfPages
      # t.string :publiser
      # t.string :country
      # t.string :mediaType
      # t.string :released
      # t.string :characters
      # t.string :povCharacters
    end
  end
end

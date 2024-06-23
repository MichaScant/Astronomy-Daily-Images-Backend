class CreateFavourites < ActiveRecord::Migration[7.1]
  def change
    create_table :favourites, :id => false do |t|
      t.integer :id
      t.references :nasa_data, null: false, foreign_key: true
      t.boolean :showDescription
      t.integer :likes
      t.boolean :liked

      t.timestamps
    end
  end
end

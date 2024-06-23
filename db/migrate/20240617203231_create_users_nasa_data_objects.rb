class CreateUsersNasaDataObjects < ActiveRecord::Migration[7.1]
  def change
    create_table :users_nasa_data_objects do |t|
      t.string :copyright
      t.string :explanation
      t.string :hdurl
      t.string :media_type
      t.string :service_version
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end

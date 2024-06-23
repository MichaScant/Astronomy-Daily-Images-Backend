class AddDateToNasaData < ActiveRecord::Migration[7.1]
  def change
    add_column :nasa_data, :date, :string
  end
end

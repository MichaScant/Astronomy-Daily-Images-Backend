class ChangeIdToString < ActiveRecord::Migration[7.1]
  def change
      change_column :nasa_data, :id, :string
  end
end

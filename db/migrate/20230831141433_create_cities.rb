class CreateCities < ActiveRecord::Migration[7.0]
  def change
    create_table :cities do |t|
      t.string :region
      t.string :country
      t.string :name
      t.integer :city_key

      t.timestamps
    end
  end
end

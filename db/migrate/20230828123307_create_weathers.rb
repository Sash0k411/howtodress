class CreateWeathers < ActiveRecord::Migration[7.0]
  def change
    create_table :weathers do |t|
      t.string :city
      t.float :temperature_min
      t.float :temperature_max
      t.string :condition

      t.timestamps
    end
  end
end

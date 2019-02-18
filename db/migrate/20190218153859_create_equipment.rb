class CreateEquipment < ActiveRecord::Migration[5.2]
  def change
    create_table :equipment do |t|
      t.string :size
      t.string :shape
      t.string :daily_price
      t.string :location
      t.string :title
      t.text :description
      t.string :photo

      t.timestamps
    end
  end
end

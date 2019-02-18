class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.string :status
      t.string :start_date
      t.string :end_date
      t.string :price
      t.references :user, foreign_key: true
      t.references :equipment, foreign_key: true

      t.timestamps
    end
  end
end

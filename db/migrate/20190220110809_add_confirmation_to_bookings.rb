class AddConfirmationToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :confirmation, :boolean, default: false, null: false
  end
end

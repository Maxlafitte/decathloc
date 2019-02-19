class AddUserToEquipments < ActiveRecord::Migration[5.2]
  def change
    add_reference :equipments, :user, foreign_key: true
  end
end

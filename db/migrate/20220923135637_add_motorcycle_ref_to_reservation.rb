class AddMotorcycleRefToReservation < ActiveRecord::Migration[7.0]
  def change
    add_reference :reservations, :motorcycle, null: false, foreign_key: true
  end
end

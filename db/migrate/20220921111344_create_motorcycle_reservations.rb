class CreateMotorcycleReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :motorcycle_reservations do |t|
      t.references :motorcycle, null: false, foreign_key:{ to_table: :motorcycles }
      t.references :reservation, null: false, foreign_key:{ to_table: :reservations }

      t.timestamps
    end
  end
end

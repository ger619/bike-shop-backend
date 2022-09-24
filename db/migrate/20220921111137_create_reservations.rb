class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.integer :total_price
      t.date :start_date
      t.date :end_date
      t.string :city

      t.timestamps
    end
  end
end

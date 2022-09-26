class CreateMotorcycles < ActiveRecord::Migration[7.0]
  def change
    create_table :motorcycles do |t|
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.string :brand
      t.string :model
      t.string :year
      t.string :description
      t.integer :booking_fee
      t.boolean :reserved

      t.timestamps
    end
  end
end

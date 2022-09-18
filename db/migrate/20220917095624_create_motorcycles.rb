class CreateMotorcycles < ActiveRecord::Migration[7.0]
  def change
    create_table :motorcycles do |t|
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.integer :productID
      t.string :brand
      t.string :model
      t.string :year
      t.string :image
      t.integer :booking_fee

      t.timestamps
    end
  end
end

class CreateMotorcycles < ActiveRecord::Migration[7.0]
  def change
    create_table :motorcycles do |t|
      t.references :category, null: false, foreign_key: true
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
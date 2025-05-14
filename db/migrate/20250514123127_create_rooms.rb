class CreateRooms < ActiveRecord::Migration[8.0]
  def change
    create_table :rooms do |t|
      t.string :name, null: false
      t.string :headline, null: false
      t.text :description
      t.string :room_number, null: false
      t.integer :room_type, null: false
      t.decimal :price_per_night, precision: 10, scale: 2, null: false
      t.integer :capacity, null: false
      t.boolean :available, default: true
      
      t.timestamps
    end
    
    add_index :rooms, :room_number, unique: true
  end
end

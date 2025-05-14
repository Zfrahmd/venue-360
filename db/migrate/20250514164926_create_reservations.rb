class CreateReservations < ActiveRecord::Migration[8.0]
  def change
    create_table :reservations do |t|
      t.references :room, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.date :check_in_date, null: false
      t.date :check_out_date, null: false
      t.integer :adults, null: false, default: 1
      t.integer :children, null: false, default: 0
      t.decimal :total_price, precision: 10, scale: 2
      t.integer :status, default: 0
      t.string :special_requests
      
      t.timestamps
    end
  end
end

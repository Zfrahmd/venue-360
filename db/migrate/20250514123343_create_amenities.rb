class CreateAmenities < ActiveRecord::Migration[8.0]
  def change
    create_table :amenities do |t|
      t.string :name, null: false
      t.text :description
      t.string :icon_class # For font-awesome or similar icons
      
      t.timestamps
    end
  end
end

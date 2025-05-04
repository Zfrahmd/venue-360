class CreateInquiries < ActiveRecord::Migration[8.0]
  def change
    create_table :inquiries do |t|
      t.string :first_name,          null: false 
      t.string :last_name
      t.string :email,              null: false, default: ""
      t.string :phone
      t.string :words,              null: false, default: ""

      t.timestamps
    end
  end
end

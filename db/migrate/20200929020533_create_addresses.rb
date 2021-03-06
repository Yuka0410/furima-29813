class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code,    null: false, default: ""  
      t.integer :area_id,       null: false
      t.string :city,           null: false, default: ""
      t.string :block,          null: false, default: ""
      t.string :building_name,               default: ""
      t.string :phone_number,   null: false, default: ""
      t.references :purchase,   null: false,  foreign_key: true
      t.timestamps
    end
  end
end

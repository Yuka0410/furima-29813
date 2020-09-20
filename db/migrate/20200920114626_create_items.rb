class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,                null: false 
      t.text :text,                  null: false 
      t.integer :category,           null: false
      t.integer :condition,          null: false
      t.integer :payer,              null: false
      t.integer :area,               null: false
      t.integer :delivery_date,      null: false
      t.integer :price,              null: false
      t.references :user,            null: false, foreign_key: true
      t.timestamps
    end
  end
end



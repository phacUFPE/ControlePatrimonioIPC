class CreateEquipment < ActiveRecord::Migration[5.1]
  def change
    create_table :equipment do |t|
      t.integer :equipment_id
      t.text :name
      t.text :brand
      t.text :model
      t.text :description
      t.decimal :price

      t.timestamps
    end
  end
end

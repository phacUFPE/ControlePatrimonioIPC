class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.integer :group_cod
      t.text :name
      t.text :description

      t.timestamps
    end
  end
end

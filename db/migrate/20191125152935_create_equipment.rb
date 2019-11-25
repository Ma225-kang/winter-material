class CreateEquipment < ActiveRecord::Migration[5.2]
  def change
    create_table :equipment do |t|
      t.string :name
      t.string :description
      t.string :photo
      t.string :address
      t.integer :price_per_day
      t.references :owner, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end

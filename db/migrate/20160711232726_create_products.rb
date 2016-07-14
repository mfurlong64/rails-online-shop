class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.decimal :price, :precision => 16, :scale => 2
      t.integer :stock

      t.timestamps null: false
    end
  end
end

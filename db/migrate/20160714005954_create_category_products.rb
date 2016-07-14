class CreateCategoryProducts < ActiveRecord::Migration
  def change
    create_table :category_products do |t|
      t.belongs_to :category, index: true
      t.belongs_to :product, index: true
      #t.integer :category_id
      #t.integer :product_id

      t.timestamps null: false
    end
  end
end

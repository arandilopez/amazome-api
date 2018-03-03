class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :sku
      t.string :name
      t.text :description
      t.decimal :price, precision: 20, scale: 2

      t.timestamps
    end
  end
end

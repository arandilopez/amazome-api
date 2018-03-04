class CreateCartsProductsTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :carts, :products
  end
end

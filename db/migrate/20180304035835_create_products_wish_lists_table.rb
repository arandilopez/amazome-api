class CreateProductsWishListsTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :products, :wish_lists
  end
end

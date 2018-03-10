namespace :products do
  desc "Add image to existing products"
  task :add_random_image => [:environment] do
    puts "****************************************"
    puts "Updated #{products.size} products"
    puts "****************************************"
    products = Product.where(image: nil)
    products.update_all(image: Faker::LoremPixel.image("50x60"))
  end
end

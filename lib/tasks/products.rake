namespace :products do
  desc "Add image to existing products"
  task :add_random_image => [:environment] do
    products = Product.where(image: nil)
    puts "****************************************"
    puts "Updated #{products.size} products"
    puts "****************************************"
    products.update_all(image: Faker::LoremPixel.image("512x512"))
  end
end

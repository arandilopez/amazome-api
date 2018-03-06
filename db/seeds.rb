require "faker"
if User.count.zero?
  User.create(name: "Arandi Lopez", email: "arandilopez.93@gmail.com", password: "username123", password_confirmation: "username123", role: :admin)

  User.create((0..10).to_a.map {
    {name: Faker::Name.name, email: Faker::Internet.unique.safe_email, password: "username123", password_confirmation: "username123"}
    }).each { |user| user.wish_lists.create(name: Faker::Commerce.department(2)) }
end

if Product.count.zero?
  Product.create((0..1000).to_a.map {
    {sku: Faker::Code.unique.isbn, name: Faker::Commerce.product_name, price: Faker::Commerce.price, description: Faker::Commerce.material}
  })
end

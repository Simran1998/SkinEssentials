# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "csv"

Product.destroy_all
AdminUser.destroy_all
Category.destroy_all

filename = Rails.root.join("db/product.csv")
puts "Loading products from the csv file: #{filename}"

csv_data_product = File.read(filename)
data = CSV.parse(csv_data_product, headers: true, encoding: "iso-8859-1")

data.each do |m|
  category = Category.find_or_create_by(name: m["category"])
  if category && category.valid?
    product = category.products.create(
      name:       m["product"],
      brand:      m["brand"],
      price:      m["price"]
    )

    puts "Invalid product #{m['product']}" unless product&.valid?

  else
    puts "invalid category #{m['category']} for product #{m['product']}."
  end
end

puts "Created #{Product.count} products records"
puts "Created #{Category.count} category records"

if Rails.env.development?
  AdminUser.create!(email: 'admin@example.com', password: 'password',
                    password_confirmation: 'password')
end
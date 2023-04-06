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

filename = Rails.root.join("db/products.csv")
puts "Loading products from the csv file: #{filename}"

csv_data = File.read(filename)
data = CSV.parse(csv_data, headers: true, encoding: "iso-8859-1")

data.each do |p|
  Product.create(
    name:       p["name"],
    price:      p["price"],
    image:      p["image"]
  )
end
puts "Created #{Product.count} products"

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
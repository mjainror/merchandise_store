# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.create([
  { name: "Reedsy Mug", description: "Reedsy Mug", price_cents: 3600, price_currency: "eur", sku: "ABC123", category_id: Category.find_by(name: "MUG")&.id },
  { name: "Reedsy T-shirt", description: "Reedsy T-shirt", price_cents: 9400, price_currency: "eur", sku: "ABC987", category_id: Category.find_by(name: "TSHIRT")&.id },
  { name: "Reedsy Hoodie", description: "Reedsy Hoodie", price_cents: 12000, price_currency: "eur", sku: "ABC123", category_id: Category.find_by(name: "HOODIE")&.id }
])

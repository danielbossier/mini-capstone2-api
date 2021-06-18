# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

product = Product.create(name: "Lambic", price: 15, image_url: "https://images.unsplash.com/photo-1576271758686-3dabd9c6aaed", description: "Spontaneuously fermented sour beer")

product = Product.create(name: "Smoothie Sour", price: 12, image_url: "", description: "Pureed fruit and beer")

product = Product.create(name: "Barrel Aged Stout", price: 20, image_url: "", description: "Stout ported aged in Woodford Reserve barrels with cocoa nibs")

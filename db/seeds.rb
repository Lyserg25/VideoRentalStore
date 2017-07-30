# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
c1 = Category.create(name: "DVD")
c2 = Category.create(name: "Blu-Ray")
c3 = Category.create(name: "PS4 Game")
c3 = Category.create(name: "PC Game")
#c.products.create(title: "Harry Potter", description:"Harry Potter", amount: "2")

g1 = Genre.create(name: "Drama")
g2 = Genre.create(name: "Thriller")
g3 = Genre.create(name: "Comedy")
g4 = Genre.create(name: "Horror")

Product.create(title: "Ghostwriter", description:"Description", genre: g1, amount: "2", category: c1)
Product.create(title: "Disturbia", description:"Description", genre: g2, amount: "2", category: c2)
Product.create(title: "The Ring", description:"Description", genre: g1, amount: "2", category: c1)
Product.create(title: "South Park", description:"Description", genre: g3, amount: "2", category: c3)
Product.create(title: "FEAR", description:"Description", genre: g4, amount: "2", category: c4)
Product.create(title: "Until Dawn", description:"Description", genre: g4, amount: "2", category: c3)

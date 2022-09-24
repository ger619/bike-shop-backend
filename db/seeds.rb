# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create(username: "John", password: '12345')
Motorcycle.create(user_id: 1, brand: "Honda", model: "CBR1000RR", year: "2021", image: "https://www.honda.com.au/content/dam/honda/australia/motorcycles/cbr1000rr/2021/overview/overview-1.jpg", booking_fee: 100)

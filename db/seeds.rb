# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Role.create(name: "Admin")
Role.create(name: "Reader")
BookCategory.create(name: "Climate")
User.create(email: "admin1@gmail.com", name: "Minhas", gender: "Male", address: "South Asia",
    mobile: "03070611116", role_id: 1, password: "123456", password_confirmation: "123456")
    
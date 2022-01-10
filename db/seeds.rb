# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create(email: "a@a", password: "aaaaaa")
Customer.create(email: "b@b", password: "aaaaaa", last_name: "a", first_name: "a", last_name_kana: "ア", first_name_kana: "ア", postal_code: "123456789", address: "123456789", telephone_number: "123456789", is_active: false)
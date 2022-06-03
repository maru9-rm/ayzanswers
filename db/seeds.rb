# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(username: <%= ENV['USER1'] %>, password: <%= ENV['PASS1'] %>, password_confirmation: <%= ENV['PASS1'] %>)
User.create!(username: <%= ENV['USER2'] %>, password: <%= ENV['PASS2'] %>, password_confirmation: <%= ENV['PASS2'] %>)
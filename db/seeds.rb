# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Categorysection.create!(category: 'Success Tip') if Rails.env.development?
Categorysection.create!(category: 'Tech') if Rails.env.development?
Categorysection.create!(category: 'Personalities') if Rails.env.development?
Categorysection.create!(category: 'Science') if Rails.env.development?

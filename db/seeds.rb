# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Family.destroy_all
Child.destroy_all
Expense.destroy_all
User.destroy_all

users = []
puts 'Creating users'
3.times do
  puts '...'
end

7.times do
  users << {
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: 'ourkids'
  }
end

users << {
  first_name: 'Carlos',
  last_name: 'Vidal',
  email: 'avocantigas@gmail.com',
  password: 'ourkids'
}

users.each do |user|
  User.create(user)
end

puts 'Users created'

puts '...'

expenses = []
puts 'Creating expenses'
3.times do
  puts '...'
end


20.times do
  expenses << {
    title: Faker::Lorem.word,
    description: Faker::Lorem.paragraph,
    date: Faker::Date.forward(23)
  }
end

expenses.each do |expense|
  exp = Expense.new(expense)
  exp.user = User.all.sample
  exp.save
end

puts 'Expenses created'

puts '...'


children = []
puts 'Creating children'
3.times do
  puts '...'
end

4.times do
  children << {
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
  }
end

children.each do |child|
  Child.create(child)
end

puts 'Children created'

puts '...'

categories = []
puts 'Creating categories'
3.times do
  puts '...'
end

9.times do
  categories << {
    name: Faker::Cannabis.category
  }
end

categories.each do |category|
  Category.create(category)
end

puts 'Categories created'

puts '...'

puts 'creating bookings'
3.times do
  puts '...'
end


fam = Family.new
fam.parent = User.first
fam.coparent = User.all.drop(1).sample

puts 'families created'

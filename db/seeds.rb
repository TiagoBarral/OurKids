# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Family.destroy_all
Expense.destroy_all
Payment.destroy_all
Child.destroy_all
User.destroy_all


# USERS
users = []
puts 'Creating users'

4.times do
  users << {
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: 'ourkids'
  }
end

users.each do |user|
  User.create(user)
end

puts 'Users created..'


# CHILDREN

puts 'Creating children'
children = []

4.times do
  children << {
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
  }
end

children.each do |child|
  Child.create(child)
end

puts 'Children created..'

# CATEGORIES

categories = []
puts 'Creating categories'

4.times do
  categories << {
    name: Faker::Cannabis.category
  }
end

categories.each do |category|
  Category.create(category)
end

puts 'Categories created..'

# FAMILIES

fam = Family.new
fam.parent = User.first
fam.coparent = User.all.drop(1).sample
fam.save

puts 'families created'


# EXPENSES

expenses = []
puts 'Creating expenses'

5.times do
  expenses << {
    title: Faker::Lorem.word,
    description: Faker::Lorem.paragraph,
    date: Faker::Date.forward(23)
  }
end
expenses.each do |expense|
  exp = Expense.new(expense)
  exp.user = User.all.sample
  exp.child = Child.all.sample
  exp.category = Category.all.sample
  exp.save
end

puts 'Expenses created'

# PAYMENTS

payments = []
puts 'Creating payments'

5.times do
  payments << {
    amount: '5',
    payment_method: 5

  }
end
# TRAP , WITH USER.SAMPLE PAYER AND PAYEE CAN BE THE SAME
payments.each do |payment|
  pay = Payment.new(payment)
  pay.family = Family.all.sample
  pay.payer = User.all.sample
  pay.payee = User.all.sample
  pay.save
end


puts "TRAP ---> WITH USER.SAMPLE PAYER AND PAYEE CAN BE THE SAME"

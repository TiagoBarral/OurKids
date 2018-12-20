# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts 'Destroying database'

ChildExpense.destroy_all
FamilyChild.destroy_all
Payment.destroy_all
Family.destroy_all
Expense.destroy_all
Category.destroy_all
Child.destroy_all
User.destroy_all


# USERS
users = []
puts 'Creating users'

users << {
  first_name: 'Vasco',
  last_name: 'Figueiredo',
  email: 'vaskafig@gmail.com',
  password: 'ourkids'
}
users << {
  first_name: 'Sheila',
  last_name: 'Tarot',
  email: 'sheila@gmail.com',
  password: 'ourkids'
}

users << {
  first_name: 'Maria',
  last_name: 'duMal',
  email: 'maria@gmail.com',
  password: 'ourkids'
}

users.each do |user|
  User.create(user)
end

puts 'Users created..'


# CHILDREN

puts 'Creating children'
children = []


children << {
  first_name: 'Boris',
  last_name: Faker::Name.last_name,
  gender: 0
}

children << {
  first_name: 'Jack',
  last_name: Faker::Name.last_name,
  gender: 0
}

children << {
  first_name: 'Tisha',
  last_name: Faker::Name.last_name,
  gender: 1
}



children.each do |child|
  Child.create(child)
end

puts 'Children created..'

# CATEGORIES

categories = []
puts 'Creating categories'

categories = %w[Education Health Fun Vacation Food Sport Clothes Others]

categories.each do |category|
  Category.create(name: category)
end

puts 'Categories created..'

# FAMILIES


fam = Family.new
fam.parent = User.first
fam.coparent = User.last
fam.save

puts 'Families created'

parent_photo = 'https://res.cloudinary.com/drpwozhzg/image/upload/v1544111156/rf61zuqqbpmfe6xh8ti1.jpg'
mother_photo = 'https://res.cloudinary.com/drpwozhzg/image/upload/v1544188763/abtabr4rjfvouddfxvme.jpg'
mother2_photo = 'https://res.cloudinary.com/drpwozhzg/image/upload/v1544112584/dnpogzmvpalzivu9ewil.jpg'
kid1_photo = 'https://res.cloudinary.com/drpwozhzg/image/upload/v1545311053/vcdf9mxkz2cp58gzf5rn-Square.jpg'
kid2_photo = 'https://res.cloudinary.com/drpwozhzg/image/upload/v1545309648/337405_4738586594183_890842433_o-Square.jpg'
kid3_photo = 'https://res.cloudinary.com/drpwozhzg/image/upload/v1545309887/ethcxacbrtcwzqr6fgbl-Square.jpg'
receipt1_photo = 'https://res.cloudinary.com/drpwozhzg/image/upload/v1545311001/dentist.jpg'
receipt2_photo = 'https://res.cloudinary.com/drpwozhzg/image/upload/v1545310999/cinema.png'

#FAMILYCHILDREN

Child.first.update(remote_photo_url: kid1_photo)
Child.find(Child.last.id - 1).update(remote_photo_url: kid2_photo)
Child.last.update(remote_photo_url: kid3_photo)

child = Child.first
fam = FamilyChild.new
fam.child = child
fam.family = Family.first
fam.save

child = Child.find(Child.last.id - 1)
fam = FamilyChild.new
fam.child = child
fam.family = Family.first
fam.save

child = Child.last
fam = FamilyChild.new
fam.child = child
fam.family = Family.first
fam.save


par = User.first
par.update(remote_photo_url: parent_photo)
# mot1.remote_photo_url = mother_photo
# mot2.remote_photo_url = mother2_photo

# par.save
# mot1.save
# mot2.save
# kid1.save
# kid2.save
# kid3.save
# rec1.save
# rec2.save

# EXPENSES

expenses = []
puts 'Creating expenses'



expenses << {
  title: 'McDonalds',
  description:'Happy meal madness',
  date: Faker::Date.backward(27),
  amount: 15,
  percentage: 50
}


expenses << {
  title: 'Ice cream',
  description:'Santini snack',
  date: Faker::Date.backward(29),
  amount: 5,
  percentage: 50
}


expenses << {
  title: 'Pizzahut',
  description:'No time to cook, just ordered some pizza',
  date: Faker::Date.backward(31),
  amount: 36,
  percentage: 50
}

expenses << {
  title: 'Cinema',
  description:'Batman returns again',
  date: Faker::Date.backward(25),
  amount: 20,
  percentage: 50
}

expenses << {
  title: 'Karts',
  description:'Awesome day driving karts',
  date: Faker::Date.backward(33),
  amount: 50,
  percentage: 50
}

expenses << {
  title: 'Dentist',
  description:'Trip to the dentist',
  date: Faker::Date.backward(23),
  amount: 50,
  percentage: 50
}


expenses << {
  title: 'Bills',
  description:'Kid\'s school bills',
  date: Faker::Date.backward(2),
  amount: 800,
  percentage: 50
}

expenses << {
  title: 'Supplies',
  description:'Books, notebooks, pencils, etc',
  date: Faker::Date.backward(8),
  amount: 130,
  percentage: 50
}

expenses << {
  title: 'Doctor',
  description:'Hospital visit, appendix removals',
  date: Faker::Date.backward(50),
  amount: 148,
  percentage: 50
}

expenses << {
  title: 'Disneyland',
  description:'Trip to Disneyland with everyone!',
  date: Faker::Date.backward(100),
  amount: 1534,
  percentage: 20
}

expenses << {
  title: 'Dubai',
  description:'Winter holiday in Dubai',
  date: Faker::Date.backward(300),
  amount: 3400,
  percentage: 20
}
##############################################

expenses << {
  title: 'Basketball',
  description:'Monthly bill for basketball training',
  date: Faker::Date.backward(60),
  amount: 27,
  percentage: 50
}

expenses << {
  title: 'Hockey',
  description:'Went to watch the hockey finals',
  date: Faker::Date.backward(60),
  amount: 79,
  percentage: 50
}

expenses << {
  title: 'Sweaters',
  description:'Bought Christmas sweaters for the kids',
  date: Faker::Date.backward(60),
  amount: 100,
  percentage: 50
}

expenses << {
  title: 'College',
  description:'Payment #3',
  date: Faker::Date.backward(60),
  amount: 3499,
  percentage: 50
}

i=0

expenses.each do |expense|

  i += 1
  family = Family.first
  parents = [family.parent, family.coparent]
  if i < 4
    exp = Expense.new(expense)
    exp.user = parents[rand(0..1)]
    exp.category = Category.find_by(name: 'Food')
    exp.save

  elsif i < 6
    exp = Expense.new(expense)
    exp.user = parents[rand(0..1)]
    exp.category = Category.find_by(name: 'Fun')
    exp.save
  elsif i == 6 || i == 9
    exp = Expense.new(expense)
    exp.user = parents[rand(0..1)]
    exp.category = Category.find_by(name: 'Health')
    exp.save
  elsif i < 9
    exp = Expense.new(expense)
    exp.user = parents[rand(0..1)]
    exp.category = Category.find_by(name: 'Education')
    exp.save
  elsif i < 12
    exp = Expense.new(expense)
    exp.user = parents[1]
    exp.category = Category.find_by(name: 'Vacation')
    exp.save
  elsif i < 14
    exp = Expense.new(expense)
    exp.user = parents[rand(0..1)]
    exp.category = Category.find_by(name: 'Sport')
    exp.save
  elsif i == 14
    exp = Expense.new(expense)
    exp.user = parents[rand(0..1)]
    exp.category = Category.find_by(name: 'Clothes')
    exp.save
  else
    exp = Expense.new(expense)
    exp.user = parents[0]
    exp.category = Category.find_by(name: 'Others')
    exp.save
  end
end

rec1 = Expense.find_by(title: 'Dentist')
rec2 = Expense.find_by(title: 'Cinema')
rec1.update(remote_receipt_url: receipt1_photo)
rec2.update(remote_receipt_url: receipt2_photo)

i = -1
Expense.all.each do |expense|
  i = -1
  rand(1..3).times do
    i += 1
    exp = ChildExpense.new
    exp.expense = expense

    exp.child = expense.user.children[i]
    exp.save
  end
end


puts 'Expenses created'

# PAYMENTS

payments = []
puts 'Creating payments'

10.times do
  payments << {
    amount: rand(10..50),
    payment_method: rand(0..3)
  }
end

# TRAP , WITH USER.SAMPLE PAYER AND PAYEE CAN BE THE SAME
payments.each do |payment|
  pay = Payment.new(payment)
  family = Family.first
  parents = [family.parent, family.coparent]
  pay.family = family
  pay.payer = parents[rand(0..1)]
  if pay.payer == family.parent
    pay.payee = family.coparent
  else
    pay.payee = family.parent
  end
  pay.save
end

children_pics = %w[https://d2v9y0dukr6mq2.cloudfront.net/video/thumbnail/r0slGlPLiq71cgwa/little-cute-kid-boy-face-portrait-closeup-grimace-smile-on-camera_sjaki1coe_thumbnail-full01.png https://www.safekids.org/sites/default/files/Safe_Kids_Day/marketing_materials/boy_smiling.jpg http://kids.wazobiamax.ng/wp-content/uploads/2017/12/Slider-boy2.png]

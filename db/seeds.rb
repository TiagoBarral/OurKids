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
  last_name: 'do mal',
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

3.times do
  children << {
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    gender: rand(0..1)
  }
end

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

puts 'families created'

parent_photo = 'https://res.cloudinary.com/drpwozhzg/image/upload/v1544111156/rf61zuqqbpmfe6xh8ti1.jpg'
mother_photo = 'https://res.cloudinary.com/drpwozhzg/image/upload/v1544188763/abtabr4rjfvouddfxvme.jpg'
mother2_photo = 'https://res.cloudinary.com/drpwozhzg/image/upload/v1544112584/dnpogzmvpalzivu9ewil.jpg'
kid1_photo = 'https://www.connectonenow.org/wp-content/uploads/2016/08/jershiaa.jpg'
kid2_photo = 'https://www.theoldglobe.org/globalassets/images/2017-2018/grinch-2017/headshot/hayden-hartpence.jpg?id=27794'
kid3_photo = 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtoSYHsKDWh01WEV2AeVDlZ6--jAg4Bhz9ubN-Z_AK5nNMntblBQ'
receipt1_photo = 'https://res.cloudinary.com/drpwozhzg/image/upload/v1544195045/42552935.jpg'
receipt2_photo = 'https://res.cloudinary.com/drpwozhzg/image/upload/v1544195045/36212418.jpg'

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



# par.remote_photo_url = parent_photo
# mot1.remote_photo_url = mother_photo
# mot2.remote_photo_url = mother2_photo
# rec1.remote_photo_url = receipt1_photo
# rec2.remote_photo_url = receipt2_photo

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
  title: 'MacDonalds',
  description:'Happy meanl madness',
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
  description:'No time to cook, just order some pizza',
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
  description:'Awsome day driving karts',
  date: Faker::Date.backward(33),
  amount: 50,
  percentage: 50
}

expenses << {
  title: 'Dentist',
  description:'trip to the dentist',
  date: Faker::Date.backward(23),
  amount: 50,
  percentage: 50
}

i=0

expenses.each do |expense|

  i += 1

  if i < 4
    exp = Expense.new(expense)
    exp.user = User.first
    exp.category = Category.find_by(name: 'Food')
    exp.save

  elsif i < 6
    exp = Expense.new(expense)
    exp.user = User.first
    exp.category = Category.find_by(name: 'Fun')
    exp.save
  else
    exp = Expense.new(expense)
    exp.user = User.first
    exp.category = Category.find_by(name: 'Health')
    exp.save
  end
end


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
  pay.family = family
  pay.payer = family.coparent
  pay.payee = family.parent
  pay.save
end

children_pics = %w[https://d2v9y0dukr6mq2.cloudfront.net/video/thumbnail/r0slGlPLiq71cgwa/little-cute-kid-boy-face-portrait-closeup-grimace-smile-on-camera_sjaki1coe_thumbnail-full01.png https://www.safekids.org/sites/default/files/Safe_Kids_Day/marketing_materials/boy_smiling.jpg http://kids.wazobiamax.ng/wp-content/uploads/2017/12/Slider-boy2.png]

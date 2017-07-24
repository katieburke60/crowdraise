# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

accounts = Account.create([
  { email: 'email1@sample.com', password: 'password', password_confirmation: 'password' },
  { email: 'email2@sample.com', password: 'password', password_confirmation: 'password' },
  { email: 'email3@sample.com', password: 'password', password_confirmation: 'password' },
  { email: 'email4@sample.com', password: 'password', password_confirmation: 'password' },
  { email: 'email5@sample.com', password: 'password', password_confirmation: 'password' },
  { email: 'email6@sample.com', password: 'password', password_confirmation: 'password' },
  { email: 'email7@sample.com', password: 'password', password_confirmation: 'password' },
  { email: 'email8@sample.com', password: 'password', password_confirmation: 'password' },
  { email: 'email9@sample.com', password: 'password', password_confirmation: 'password' },
  { email: 'email0@sample.com', password: 'password', password_confirmation: 'password' }
])

backers = Backer.create({
  { account_id: 1, username: 'Garrett Martin' }
  { account_id: 2, username: 'Beenish Ahmed' }
  { account_id: 3, username: 'Katy Pyle' }
  { account_id: 4, username: 'Tearibles' }
  { account_id: 5, username: 'Fria Lugen' }
  { account_id: 6, username: 'Marcus Bree' }
  { account_id: 7, username: 'Dan Wu' }
  { account_id: 8, username: 'Palmer Watson' }
  { account_id: 9, username: 'Kelly Anglewood' }
  { account_id: 10, username: 'Jon Stein' }
})

categories = Category.create({
  { name: 'Art' }
  { name: 'Design' }
  { name: 'Film' }
  { name: 'Games' }
  { name: 'Music' }
  { name: 'Technology' }
  { name: 'Food' }
})

backers = Backer.create({
  { account_id: 1, username: 'Garrett Martin' }
  { account_id: 2, username: 'Beenish Ahmed' }
  { account_id: 3, username: 'Katy Pyle' }
  { account_id: 4, username: 'Tearibles' }
  { account_id: 5, username: 'Fria Lugen' }
  { account_id: 6, username: 'Marcus Bree' }
  { account_id: 7, username: 'Dan Wu' }
  { account_id: 8, username: 'Palmer Watson' }
  { account_id: 9, username: 'Kelly Anglewood' }
  { account_id: 10, username: 'Jon Stein' }
})

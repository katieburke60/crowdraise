# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

users = User.create([
  { email: 'email1@sample.com', username: 'Garrett Martin', password: 'password', password_confirmation: 'password' },
  { email: 'email2@sample.com', username: 'Beenish Ahmed', password: 'password', password_confirmation: 'password' },
  { email: 'email3@sample.com', username: 'Katy Pyle', password: 'password', password_confirmation: 'password' },
  { email: 'email4@sample.com', username: 'Silly Sally', password: 'password', password_confirmation: 'password' },
  { email: 'email5@sample.com', username: 'Fria Lugen', password: 'password', password_confirmation: 'password' },
  { email: 'email6@sample.com', username: 'Marcus Bree', password: 'password', password_confirmation: 'password' },
  { email: 'email7@sample.com', username: 'Dan Wu', password: 'password', password_confirmation: 'password' },
  { email: 'email8@sample.com', username: 'Palmer Watson', password: 'password', password_confirmation: 'password' },
  { email: 'email9@sample.com', username: 'Kelly Anglewood', password: 'password', password_confirmation: 'password' },
  { email: 'email0@sample.com', username: 'Jon Stein', password: 'password', password_confirmation: 'password' },
])

campaigns = Campaign.create([
    { name: 'Space Odessey Video Game', description: 'Awesome VR enabled video game that puts you in space!', funding_goal: 300000, raised: 0, deadline: DateTime.new(2017,9,1,17), goal_met?: false, creator_id: 1, image: 'https://s3.amazonaws.com/policymic-images/eph9wqbj52ix1wppcjl16l2iujos76hjoa7l4229cinqsthfyhjw4d0w3c1qsdai.jpg' },
    { name: 'American Hummus flavored popcorn', description: 'First product to kick off launch a new healthy snack to celebrate the 4th of July.', funding_goal: 15000, raised: 0, deadline: DateTime.new(2017,10,12,17), goal_met?: false, creator_id: 2, image: 'https://s-media-cache-ak0.pinimg.com/736x/f4/71/eb/f471ebf94a2b74cf61cad6a715b6e02d--blue-popcorn-colored-popcorn.jpg' },
    { name: 'Katie House Full Length Album', description: 'A full length original folk music album that I have been producing since my teens.', funding_goal: 25000, raised: 0, deadline: DateTime.new(2017,11,4,17), goal_met?: false, creator_id: 3, image: 'http://esnlinz.org/sites/esnlinz.org/files/pages/images/Austrian-folk-performers-In-traditional-costumes-Image-by-girl_onthe_les.jpg' },
    { name: 'Alpha Glass', description: 'Your first casual AR smart glasses with an internal optical system inside the frame', funding_goal: 150000, raised: 0, deadline: DateTime.new(2017,11,17,17), goal_met?: false, creator_id: 4, image: 'http://wp.streetwise.co/wp-content/uploads/2016/05/MetaAugmentedRealityHeadset-936x360.jpg' },
    { name: 'The Brise Climbing Pant', description: 'A performance rock climbing pant designed to combine style and function.', funding_goal: 30000, raised: 0, deadline: DateTime.new(2017,12,2,17), goal_met?: false, creator_id: 5, image: 'https://adventurejunkies-theadventurejunk.netdna-ssl.com/wp-content/uploads/Best-Climbing-Pants-3.jpg' },
    { name: 'Fleye Personal Flying Robot', description: 'A safe, fun, and autonomous drone with open API and SDK.', funding_goal: 500000, raised: 0, deadline: DateTime.new(2017,8,20,17), goal_met?: false, creator_id: 6, image: 'https://gadgetflowcdn.com/wp-content/uploads/2016/01/Fleye_Your_Personal_Flying_Robot_01.jpg' },
])

# def seed_image(file_name)
#   File.open(File.join(Rails.root, "/app/assets/images/seed/#{file_name}.jpg"))
# end
#
# campaigns.map do |attributes|
#   attributes[:image] = seed_image(attributes.name)
# end

# categories = Category.create({
#   { name: 'Art' }
#   { name: 'Design' }
#   { name: 'Film' }
#   { name: 'Games' }
#   { name: 'Music' }
#   { name: 'Technology' }
#   { name: 'Food' }
# })

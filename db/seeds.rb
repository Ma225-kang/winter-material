# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

first_equipment = Equipment.new(
    name: "Pair of freesyle skis",
    description: "Very good condition",
    address: "Contamines Montjoie",
    price_per_day: 50,
    photo: "https://i.ebayimg.com/images/g/EOAAAOSwESxcsTmk/s-l640.jpg"
  )

second_equipment = Equipment.new(
    name: "Helmet",
    description: "Good",
    address: "Paris",
    price_per_day: 34,
    photo: "https://www.ruroc.com/media/catalog/product/c/h/chaos-ice-snow.jpg?quality=80&bg-color=255,255,255&fit=bounds&height=&width="
  )

third_equipment = Equipment.new(
    name: "Pair of gloves",
    description: "Like new",
    address: "Courchevel",
    price_per_day: 20,
    photo: "http://www.assetcoin.uk/images/cate_161/640/1-Pair-Professional-adult-Ski-Gloves-Snowboard-Gloves-Winter-Thermal-Threefinger-outdoor-Warm-Climbing-Waterproof-Snow-Gloves-SFKM20810-jzj0.jpg"
  )

fourth_equipment = Equipment.new(
    name: "Ski boots",
    description: "New with tags",
    address: "Lons-le-Saunier",
    price_per_day: 150,
    photo: "http://cdn.welove2ski.com/wp-content/uploads/unnamed-5.jpg"
  )


# equipment_names = ["skis","outfit","helmet","gloves","wool socks","my grandma sweater"]
# description = ["good state", "dirty but useable", "old but useful", "have fun"]
# cities = ['Nantes', 'Paris', 'Bordeaux', 'Lyon' ]
# url_pic = ["https://images.unsplash.com/photo-1485809052957-5113b0ff51af?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60","https://images.unsplash.com/photo-1505648885168-be2715dd4a55?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", "https://images.unsplash.com/photo-1529909277511-1628d64875ea?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", "https://images.unsplash.com/photo-1552225193-d1808c1c72d7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60", "https://images.unsplash.com/photo-1553981066-cdfecb228180?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=967&q=80" ,"https://images.unsplash.com/photo-1544620862-d47d57948ecc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60" ]
# price = [ 12, 34, 53, 89]

# attributes = equipment_names.map do |name|
#   {
#     name: name,
#     description: description.sample,
#     address: cities.sample,
#     price_per_day: price.sample
#   }

# end

status = ["declined", "accepted", "pending"]

puts "Cleaning db..."

Reservation.destroy_all
Equipment.destroy_all
User.destroy_all

puts "starting seeds..."

mn = User.new(first_name: "Marie Noelle", last_name: "Christmas", email: "marie-noelle@example.com", password: "password")
mn.remote_photo_url = "https://images.unsplash.com/photo-1524593689594-aae2f26b75ab?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
mn.save!
lyly = User.new(first_name: "Maylis", last_name: "lyly", email: "mayliscastell@example.com", password: "password")
lyly.remote_photo_url = "https://images.unsplash.com/photo-1552673304-23f6ad21aada?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
lyly.save!
ophe = User.new(first_name: "Ophélie", last_name: "aux fraises", email: "ophelie@example.com", password: "password")
ophe.remote_photo_url = "https://images.unsplash.com/photo-1543610892-0b1f7e6d8ac1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
ophe.save!
elsa = User.new(first_name: "Elsa", last_name: "Patakis", email: "elsa@example.com", password: "password")
elsa.remote_photo_url = "https://images.unsplash.com/photo-1544725176-7c40e5a71c5e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"
elsa.save!

first_equipment.owner = lyly
first_equipment.save!

second_equipment.owner = mn
second_equipment.save!

third_equipment.owner = ophe
third_equipment.save!

fourth_equipment.owner = elsa
fourth_equipment.save!

# attributes.each_with_index do |attr, index|
#   equipment = Equipment.new(attr)
#   equipment.owner = lyly
#   equipment.remote_photo_url = url_pic[index]
#   equipment.save!
#   sleep(1)
# end

reservation = Reservation.new(equipment: first_equipment, user: mn, start_date: Faker::Date.forward(days: 2), end_date: Faker::Date.forward(days: 23),status: status.sample)
reservation = Reservation.new(equipment: second_equipment, user: lyly, start_date: Faker::Date.forward(days: 2), end_date: Faker::Date.forward(days: 23),status: status.sample)
reservation = Reservation.new(equipment: third_equipment, user: ophe, start_date: Faker::Date.forward(days: 2), end_date: Faker::Date.forward(days: 23),status: status.sample)
reservation = Reservation.new(equipment: fourth_equipment, user: lyly, start_date: Faker::Date.forward(days: 2), end_date: Faker::Date.forward(days: 23),status: status.sample)

  # reservation = Reservation.new(equipment: Equipment.all.sample, user: mn , start_date: Faker::Date.forward(days: 2), end_date: Faker::Date.forward(days: 23),status: status.sample)
  # reservation.save!
  # reservation = Reservation.new(equipment: Equipment.all.sample, user: ophe, start_date: Faker::Date.forward(days: 2), end_date: Faker::Date.forward(days: 23),status: status.sample)
  # reservation.save!

puts "Done with seeds..."

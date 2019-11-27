# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
equipment_names = ["skis","outfit","helmet","gloves","wool socks","my grandma sweater"]
description = ["good state", "dirty but useable", "old but useful", "have fun"]
cities = ['Nantes', 'Paris', 'Bordeaux', 'Lyon' ]
url_pic = ["https://images.unsplash.com/photo-1551524559-8af4e6624178?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=926&q=80","https://images.unsplash.com/photo-1453694595360-51e193e121fc?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=966&q=80" ,"https://images.unsplash.com/photo-1485839240317-550557b58b49?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60" ,"https://images.unsplash.com/photo-1557761873-69fdf401fb79?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60" ,"https://images.unsplash.com/photo-1553981066-cdfecb228180?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=967&q=80" ,"https://images.unsplash.com/photo-1455128677232-0413bef74851?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80" ]
price = [ 12, 34, 53, 89]

attributes = equipment_names.map do |name|
  {
    name: name,
    description: description.sample,
    address: cities.sample,
    price_per_day: price.sample
  }

end

status = ["not available", "available", "pending"]

puts "Cleaning db..."

Reservation.destroy_all
Equipment.destroy_all
User.destroy_all

puts "starting seeds..."

mn = User.new(first_name: "Marie Noelle", last_name: "Christmas", email: "marie-noelle@example.com", password: "password")
mn.remote_photo_url = "https://images.unsplash.com/photo-1507146426996-ef05306b995a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80"
mn.save!
lyly = User.new(first_name: "Maylis", last_name: "lyly", email: "mayliscastell@example.com", password: "password")
lyly.remote_photo_url = "https://images.unsplash.com/photo-1526336024174-e58f5cdd8e13?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80"
lyly.save!
ophe = User.new(first_name: "Ophélie", last_name: "aux fraises", email: "ophelie@example.com", password: "password")
ophe.remote_photo_url = "https://images.unsplash.com/photo-1510771463146-e89e6e86560e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=564&q=80"
ophe.save!

attributes.each_with_index do |attr, index|
  equipment = Equipment.new(attr)
  equipment.owner = lyly
  equipment.remote_photo_url = url_pic[index]
  equipment.save!
  sleep(1)
end

  reservation = Reservation.new(equipment: Equipment.all.sample, user: mn , start_date: Faker::Date.forward(days: 2), end_date: Faker::Date.forward(days: 23),status: status.sample)
  reservation.save!
  reservation = Reservation.new(equipment: Equipment.all.sample, user: ophe, start_date: Faker::Date.forward(days: 2), end_date: Faker::Date.forward(days: 23),status: status.sample)
  reservation.save!

puts "Done with seeds..."

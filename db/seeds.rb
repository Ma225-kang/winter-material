# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
equipment_types = ["skis","outfit","helmet","gloves","wool socks","my grandma sweater"]
description = ["good state", "dirty but useable", "old but useful", "have fun"]
status = ["not available", "available", "pending"]
price = [ 12, 34, 53, 89]

puts "Cleaning db..."

Reservation.destroy_all
Equipment.destroy_all
User.destroy_all

puts "starting seeds..."

  mn = User.new(first_name: "Marie Noelle", last_name: "Christmas", email: "marie-noelle@example.com", password: "password")
  mn.save!
  lyly = User.new(first_name: "Maylis", last_name: "lyly", email: "mayliscastell@example.com", password: "password")
  lyly.save!
  ophe = User.new(first_name: "Ophélie", last_name: "aux fraises", email: "ophelie@example.com", password: "password")
  ophe.save!

10.times do
  equipment = Equipment.new(owner: lyly, name: equipment_types.sample ,description: description.sample , address: Faker::Address.city ,price_per_day: price.sample )
  equipment.save!
end

  reservation = Reservation.new(equipment: Equipment.all.sample, user: mn , start_date: Faker::Date.forward(days: 2), end_date: Faker::Date.forward(days: 23),status: status.sample)
  reservation.save!
  reservation = Reservation.new(equipment: Equipment.all.sample, user: ophe, start_date: Faker::Date.forward(days: 2), end_date: Faker::Date.forward(days: 23),status: status.sample)
  reservation.save!

puts "Done with seeds..."

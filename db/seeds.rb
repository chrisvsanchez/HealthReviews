require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Healthsystem.destroy_all
Location.destroy_all
Hospital.destroy_all
User.destroy_all
Review.destroy_all

puts "Creating Healthsystem seed"
10.times do 
Healthsystem.create(name: Faker::Name.unique.name+ " Health system")
end
puts " Healthsystem seed complete"

puts "Creating locations"
10.times do 
Location.create(state:Faker::Address.state,city:Faker::Address.city,zip:Faker::Address.zip_code,healthsystem_id: Healthsystem.all.sample.id)
end
puts "Location complete"

Hospital.hospital_info
puts "Creating Hospitals"
15.times do 
Hospital.create(name:Faker::Name.unique.name+" Hospital",address:Faker::Address.street_address,speciality:"Surgery",location_id:Location.all.sample.id)
end
puts " Hospital seed complete"


puts "Creating Users "
14.times do 
User.create(name: Faker::Name.unique.name,username: Faker::Games::Pokemon.unique.name,password: "123",is_employee: Faker::Boolean.boolean)
end
puts " Users seed complete"

puts "Creating Reviews "
20.times do 
Review.create(
title:Faker::Book.title,content:Faker::Lorem.paragraph,rating:rand(0..10),user_id: User.all.sample.id,hospital_id: Hospital.all.sample.id,healthsystem_id: Healthsystem.all.sample.id)
end
puts "  Review seed complete"
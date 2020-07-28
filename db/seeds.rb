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

Healthsystem.create([
    {
       name: Faker::Name.name
    },
    {
       name: Faker::Name.name
    },
    {
       name: Faker::Name.name
    },
    {
        name: Faker::Name.name
    }
])
puts " Healthsystem seed complete"
puts "Creating locations"

Location.create([
    {
        state:Faker::Address.state,
        city:Faker::Address.city,
        zip:Faker::Address.zip_code,
        healthsystem_id: Healthsystem.all.sample.id
    },
    {
        state:Faker::Address.state,
        city:Faker::Address.city,
        zip:Faker::Address.zip_code,
        healthsystem_id: Healthsystem.all.sample.id
    },
    {
        state:Faker::Address.state,
        city:Faker::Address.city,
        zip:Faker::Address.zip_code,
        healthsystem_id: Healthsystem.all.sample.id
    },
    {
        state:Faker::Address.state,
        city:Faker::Address.city,
        zip:Faker::Address.zip_code,
        healthsystem_id: Healthsystem.all.sample.id
    }
])
puts "Location complete"

puts "Creating Hospitals"
Hospital.create([
    {
        name:Faker::Company.industry ,
        address:Faker::Address.street_address,
        speciality:"Surgery",
    location_id:Location.all.sample.id

    },
    {
    name:Faker::Company.industry, 
    address:Faker::Address.street_address,
    speciality:"Psych",
    location_id:Location.all.sample.id

    },
    {
    name: Faker::Company.industry ,
    address:Faker::Address.street_address,
    speciality: "Psych",
    location_id: Location.all.sample.id

    },
    {
    name: Faker::Company.industry,
    address:Faker::Address.street_address,
    speciality: "Cardiac Surgery",
    location_id: Location.all.sample.id

    }
])

puts " Hospital seed complete"
puts "Creating Users "
User.create([
    {
        name: Faker::Name.name,
        username: Faker::Games::Pokemon.name,
        password: "123",
        is_employee: true
    },
    {
        name: Faker::Name.name,
        username: Faker::Games::Pokemon.name,
        password: "123",
        is_employee: true
    },
    {
        name: Faker::Name.name,
        username: Faker::Games::Pokemon.name,
        password: "123",
        is_employee: false
    },
    {
        name: Faker::Name.name,
        username: Faker::Games::Pokemon.name,
        password: "123",
        is_employee: false
    }
])
puts " Users seed complete"
puts "Creating Reviews "
Review.create([
    {
title:Faker::Book.title,
content:Faker::Lorem.sentence(word_count: 3, supplemental: true, random_words_to_add: 4),
rating:rand(0..10),
user_id: User.all.sample.id,
hospital_id: Hospital.all.sample.id,
healthsystem_id: Healthsystem.all.sample.id
    },
    {
title:Faker::Book.title,
content:Faker::Lorem.sentence(word_count: 3, supplemental: true, random_words_to_add: 4),
rating:rand(0..10),
user_id: User.all.sample.id,
hospital_id: Hospital.all.sample.id,
healthsystem_id: Healthsystem.all.sample.id
    },
    {
title:Faker::Book.title,
content:Faker::Lorem.sentence(word_count: 3, supplemental: true, random_words_to_add: 4),
rating:rand(0..10),
user_id: User.all.sample.id,
hospital_id: Hospital.all.sample.id,
healthsystem_id: Healthsystem.all.sample.id
    },
    {
        title:Faker::Book.title,
        content:Faker::Lorem.sentence(word_count: 3, supplemental: true, random_words_to_add: 4),
        rating:rand(0..10),
        user_id: User.all.sample.id,
        hospital_id: Hospital.all.sample.id,
        healthsystem_id: Healthsystem.all.sample.id
    }
])
puts "  Review seed complete"
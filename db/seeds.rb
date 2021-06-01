# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cities = ['Astana', 'Almaty', 'Kokshetau', 'Petropavlovsk', 'Pavlodar', 'Kostanay', 'Oral']
cities.each do |city|
  City.create(name: city)
end

categories = ['Cars', 'General', 'Textiles', 'Furniture', 'Clothes', 'Build']
categories.each do |category|
  Category.create(name: category)
end

def random_city_id
  City.pluck(:id).shuffle.first
end

def random_category_id
  Category.pluck(:id).shuffle.first
end

5.times do |i|
  user = User.create(
    name: "client #{i}",
    username: "client_#{i}",
    email: "c#{i}@a.a",
    role: 0,
    link: rand(36**8).to_s(36),
    phone: rand(10 ** 10),
    bio: "This is a bio for user client_#{i}",
    password: "c#{i}@a.a",
    password_confirmation: "c#{i}@a.a",
  )
end

10.times do |i|
  user = User.create(
    name: "aide #{i}",
    username: "aide_#{i}",
    email: "a#{i}@a.a",
    role: 1,
    link: rand(36**8).to_s(36),
    phone: rand(10 ** 10),
    bio: "This is a bio for user aide#{i}",
    password: "a#{i}@a.a",
    password_confirmation: "a#{i}@a.a",
  )

  user.aide = Aide.new
  user.save
end

User.all.each do |client|
  2.times do
    client.locations.create(city_id: random_city_id, address: rand(36**8).to_s(36))
  end
end

Aide.all.each do |aide|
  2.times do
    Skill.create(aide_id: aide.id, category_id: random_category_id, description: rand(36**8).to_s(36))
  end
end

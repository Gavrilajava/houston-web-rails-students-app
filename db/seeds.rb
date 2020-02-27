# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Student.destroy_all
Instructor.destroy_all

10.times do
  Instructor.create(name: Faker::Name.name)
end

100.times do
  r = Instructor.all.sample.id
  Student.create(name: Faker::Name.name, age: rand(18...70), major: Faker::Educator.subject, instructor_id: r)
end
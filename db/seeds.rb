# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Job.destroy_all
puts "Deleting all jobs..."

file = URI.open('https://images.unsplash.com/photo-1583511655826-05700d52f4d9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80')
job = Job.new(
  title: "I need somebody to walk my super cute doggie",
  details: "I'm looking for somebody to take my baby for a walk tomorrow afternoon since I will be very busy. We have a nice park in the negihbourhood with a dogpark, that is Pumpkin's favourite place.",
  location: "Calle de Montesa, 39, 28006 Madrid",
  price: 8,
  duration: 1,
  date: "2021. 06. 17.",
  user: User.find(1)
)
job.photo.attach(io: file, filename: 'dog.png', content_type: 'image/png')
job.save!


# t.bigint "user_id", null: false
# t.string "title"
# t.string "details"
# t.string "location"
# t.date "date"
# t.integer "duration"
# t.integer "price"
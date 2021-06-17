# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
UserCategory.destroy_all
Category.destroy_all
Review.destroy_all
puts "Deleting all reviews..."
Booking.destroy_all
puts "Deleting all bookings..."
Job.destroy_all
puts "Deleting all jobs..."
User.destroy_all
puts "Deleting all users..."

animal = Category.create(
  name: "Animal care/Petsitting")
  file = URI.open('https://res.cloudinary.com/dhcndnfmu/image/upload/v1623924305/animal.jpg')
  animal.photo.attach(io:file, filename: 'animal.png', content_type: 'image/png')

architecture = Category.create(
  name:  "Architecture/Construction")
  file = URI.open('https://res.cloudinary.com/dhcndnfmu/image/upload/v1623924228/architecture.png')
  animal.photo.attach(io:file, filename: 'architecture.png', content_type: 'image/png')

baby = Category.create(
  name: "Baby/Child care")
  file = URI.open('https://res.cloudinary.com/dhcndnfmu/image/upload/v1623924296/baby.png')
  animal.photo.attach(io:file, filename: 'baby.png', content_type: 'image/png')

education = Category.create(
  name: "Education/Training")
  file = URI.open('https://res.cloudinary.com/dhcndnfmu/image/upload/v1623924312/education.jpg')
  animal.photo.attach(io:file, filename: 'education.jpg', content_type: 'image/jpg')

food = Category.create(
  name: "Food /Grocery Shopping")
  file = URI.open('https://res.cloudinary.com/dhcndnfmu/image/upload/v1623924369/food.png')
  animal.photo.attach(io:file, filename: 'food.png', content_type: 'image/png')

gardening = Category.create(
  name: "Home/Gardening")
  file = URI.open('https://res.cloudinary.com/dhcndnfmu/image/upload/v1623924328/gardening.png')
  animal.photo.attach(io:file, filename: 'gardening.png', content_type: 'image/png')

technology = Category.create(
  name: "Information Technology")
  file = URI.open('https://res.cloudinary.com/dhcndnfmu/image/upload/v1623924410/technology.jpg')
  animal.photo.attach(io:file, filename: 'echnology.jpg', content_type: 'image/jpg')

production = Category.create(
  name: "Production/Manufacturing")
  file = URI.open('https://res.cloudinary.com/dhcndnfmu/image/upload/v1623924348/production.jpg')
  animal.photo.attach(io:file, filename: 'production.jpg', content_type: 'image/jpg')

logistics = Category.create(
  name: "Distribution/Logistics")
  file = URI.open('https://res.cloudinary.com/dhcndnfmu/image/upload/v1623924340/logistics.jpg')
  animal.photo.attach(io:file, filename: 'logistics.jpg', content_type: 'image/jpg')

others = Category.create(
  name: "Others")
  file = URI.open('https://res.cloudinary.com/dhcndnfmu/image/upload/v1623924322/others.png')
  animal.photo.attach(io:file, filename: 'other.png', content_type: 'image/png')


lili = User.new(
  first_name: "Lili",
  last_name: "Vincze",
  introduction: "Hello everybody, I really enjoy helping out with taking care of animals or doing some gardening jobs. Usually I need help with cleaning or grocery shopping. Feel free to message me!",
  password: "123456",
  email: "lili@vincze.com",
  address: "Madrid, Puerta del angel"
)
lili.save!

puts "Created users."


file = URI.open('https://images.unsplash.com/photo-1583511655826-05700d52f4d9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80')
job = Job.new(
  title: "I need somebody to walk my super cute doggie",
  details: "I'm looking for somebody to take my baby for a walk tomorrow afternoon since I will be very busy. We have a nice park in the negihbourhood with a dogpark, that is Pumpkin's favourite place.",
  location: "Calle de Montesa, 39, 28006 Madrid",
  price: 8,
  duration: 1,
  date: "2021. 06. 17.",
  user: lili
)
UserCategory.create(user: lili, category: baby)
job.photo.attach(io: file, filename: 'job.png', content_type: 'image/png')
job.save!

file = URI.open('https://images.unsplash.com/photo-1501820488136-72669149e0d4?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGNhdHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60')
job = Job.new(
  title: "Handsome babe needs to be taken care of",
  details: "I have to leave town for a few days, so I am looking for someone who would take care of the love of my life, Mister Cotton. He has to be fed four times a day with premium cat food. His litter needs to bo changed also twice a day. You should take care, because if his needs are not satisfied well enough Mister Cotton will attack you. IMPORTANT: Avoid eye contact.",
  location: "Madrid, Puerta del Sol",
  price: 22,
  duration: 3,
  date: "2021. 06. 19.",
  user: lili
)
UserCategory.create(user: lili, category: food)
job.photo.attach(io: file, filename: 'job.png', content_type: 'image/png')
job.save!

file = URI.open('https://images.unsplash.com/photo-1588964895597-cfccd6e2dbf9?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Z3JvY2VyaWVzfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60')
job = Job.new(
  title: "Grocery shopping tomorrow in the morning",
  details: "I need somebody to do the shopping for me. I need a lot of things from the supermarket, so preferably I am looking for a strong young man who can carry many bags.",
  location: "Puerta del Angel",
  price: 11,
  duration: 2,
  date: "2021. 06. 16.",
  user: lili
)
UserCategory.create(user: lili, category: gardening)
job.photo.attach(io: file, filename: 'job.png', content_type: 'image/png')
job.save!

file = URI.open('https://images.unsplash.com/photo-1561382774-7f200b5f5c3c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80')
job = Job.new(
  title: "Grass cutting",
  details: "Hello, my garden looks terrible, the grass is super long, I need someone to cut it for me!",
  location: "Casa de campo, Madrid",
  price: 30,
  duration: 5,
  date: "2021. 06. 16.",
  user: lili
)
UserCategory.create(user: lili, category: gardening)
job.photo.attach(io: file, filename: 'job.png', content_type: 'image/png')
job.save!

file = URI.open('https://images.unsplash.com/photo-1578593195423-df7df9563457?ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8aG91c2V3b3JrfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60')
job = Job.new(
  title: "Clean my windows please",
  details: "I need SOS help, I can't even look through them! I have 12 windows, I'd like to pay 2 euros for each.",
  location: "Madrid",
  price: 24,
  duration: 3,
  date: "2021. 06. 16.",
  user: lili
)
UserCategory.create(user: lili, category: others)
job.photo.attach(io: file, filename: 'job.png', content_type: 'image/png')
job.save!

file = URI.open('https://images.unsplash.com/photo-1489274495757-95c7c837b101?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aXJvbmluZ3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60')
job = Job.new(
  title: "Clean my windows please",
  details: "Hello, I have some shirts and I need them to be ironed, please help. 8 shirts in case we want to be accurate.",
  location: "Madrid",
  price: 8,
  duration: 1,
  date: "2021. 06. 19.",
  user: lili
)
UserCategory.create(user: lili, category: others)
job.photo.attach(io: file, filename: 'job.png', content_type: 'image/png')
job.save!


puts "Created jobs"
puts "Created categories"


# t.bigint "user_id", null: false
# t.string "title"
# t.string "details"
# t.string "location"
# t.date "date"
# t.integer "duration"
# t.integer "price"

require 'faker'

User.destroy_all
Event.destroy_all
Attendance.destroy_all


20.times do
   user = User.create!(first_name: Faker::Cat.name, last_name: Faker::Pokemon.name,  description: Faker::Hipster.sentences)
   end
puts "20 users ont été créés"
20.times do
    event = Event.create!(title: Faker::Hipster.sentence(3), description: Faker::Hipster.sentence(5), user: User.all.sample, start_date: Faker::Date.forward(23), duration: rand(100..10000), price: rand(1..1000), location: Faker::HarryPotter.location)
   end
puts "20 events ont été créés"
   30.times do
       attendance = Attendance.create!(stripe_customer_id: (0...5).map { ('a'..'z').to_a[rand(26)] }.join, user: User.all.sample, event: Event.all.sample)
   end
puts "30 attendances ont été créées"

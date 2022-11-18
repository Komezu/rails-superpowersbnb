p "Cleaning up the database... 🧹"

Booking.destroy_all
Superpower.destroy_all
User.destroy_all

p "Database cleaned up! 👍"

User.create!(email: "deku@gmail.com", username: "Deku", password: 123456)
rentor = User.create!(email: "rentor@gmail.com", username: "that-rentor", password: 123456)
rentee = User.create!(email: "rentee@gmail.com", username: "that-rentee", password: 123456)

p "Created #{User.count} users."

Superpower.create!([
{
  name: "Eat 100 burgers",
  description: "Want to splurge on burgers but feel too full too fast? Get the ability to eat all the burgers you want.",
  category: "imperceptible",
  price_per_day: 1200,
  listed: true,
  address: "16 Villa Gaudelet, Paris",
  user: rentor
},
{
  name: "Sleep with eyes open",
  description: "Tired of being called out in class or at your job? Get the ability to sleep with your eyes open!",
  category: "imperceptible",
  price_per_day: 5000,
  listed: true,
  address: "16 Villa Gaudelet, Paris",
  user: rentor
},
{
  name: "Electricity Manipulation",
  description: "Lost electrity in your area? This is your chance to be a hero and light up the whole town.",
  category: "elemental",
  price_per_day: 2800,
  listed: true,
  address: "16 Villa Gaudelet, Paris",
  user: rentor
},
{
  name: "Body Bulk",
  description: "Got a date and want to impress? Bulk up without going to the gym with this superpower!",
  category: "transformation",
  price_per_day: 3000,
  listed: true,
  address: "16 Villa Gaudelet, Paris",
  user: rentor
},
{
  name: "Invisibility",
  description: "Want to know if your co-workers or friends are talking about you behind your back? Get the ability to become invisible and eavesdrop.",
  category: "superhuman",
  price_per_day: 8000,
  listed: true,
  address: "16 Villa Gaudelet, Paris",
  user: rentor
},
{
  name: "Teleportation",
  description: "Late for a meeting? Get the ability to teleport - one time use only!",
  category: "superhuman",
  price_per_day: 10000,
  listed: true,
  address: "16 Villa Gaudelet, Paris",
  user: rentor
},
{
  name: "X-Ray Vision",
  description: "Are you a doctor but slept throughout your X-ray lessons? Get the ability to scan your patients at will.",
  category: "superhuman",
  price_per_day: 5000,
  listed: true,
  address: "Lille, France",
  user: rentor
},
{
  name: "Pyrokinetic",
  description: "Feeling cold during the winter? Get the ability to be the HOT one in the room.",
  category: "elemental",
  price_per_day: 5000,
  listed: true,
  address: "Macau Tower, Macau",
  user: rentor
},
{
  name: "Code Whisperer",
  description: "Can't fix that bug in your code? Use this superpower to summon a code whisperer, a trump card, called Stephane.",
  category: "others",
  price_per_day: 9000,
  listed: true,
  address: "16 Villa Gaudelet, Paris",
  user: rentor
},
{
  name: "Communicate with animals",
  description: "Always wanted to know what your pet is complaining about? Get this power to get rid of that language barrier and converse with them!",
  category: "others",
  price_per_day: 12000,
  listed: true,
  address: "2201 Rue Leger",
  user: rentor
}])

p "Created #{Superpower.count} superpowers."

Superpower.all.each_with_index do |superpower, index|
  file = File.open(Rails.root.join("app/assets/images/#{index}.jpg"))
  superpower.photo.attach(io: file, filename: "#{index}.jpg", content_type: "image/jpg")
end

p "Attached photos to superpowers! 📸"

Booking.create!([
{
  start_date: Date.today,
  end_date: Date.today + 3,
  status: "accepted",
  superpower: Superpower.first,
  user: rentee
},
{
  start_date: Date.today + 3,
  end_date: Date.today + 14,
  status: "declined",
  superpower: Superpower.last,
  user: rentee
}])

p "Created #{Booking.count} bookings."

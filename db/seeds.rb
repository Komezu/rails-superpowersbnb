Booking.destroy_all
Superpower.destroy_all
User.destroy_all

user = User.create!(email: "first-user@onepunchman.com", username: "test-user", password: 123456)

Superpower.create!([
{
  name: "Sleep with eyes open",
  description: "Tired of being called out in class or your job? Get the ability to sleep with your eyes open!",
  category: "imperceptible",
  price_per_day: 5000,
  listed: true,
  user:
},
{
  name: "Electricity Manipulation",
  description: "Lost electrity in your area? Get the ability to be a hero and light up the whole town.",
  category: "elemental",
  price_per_day: 2800,
  listed: true,
  user:
},
{
  name: "Body Bulk",
  description: "Got a date and want to impress? Get this ability to bulk up without going to the gym",
  category: "transformation",
  price_per_day: 3000,
  listed: true,
  user:
},
{
  name: "Invisibility",
  description: "Want to know if your co-workers or friends are talking about you behind your back? Get the ability to become invisible and eavesdrop.",
  category: "superhuman",
  price_per_day: 8000,
  listed: false,
  user:
},
{
  name: "Teleportation",
  description: "Late for a meeting? Get the ability to teleport - one time use only!",
  category: "superhuman",
  price_per_day: 10000,
  listed: false,
  user:
},
{
  name: "X-Ray Vision",
  description: "Are you a doctor but slept throughout your X-ray lessons? Get the ability to scan people fast.",
  category: "superhuman",
  price_per_day: 5000,
  listed: false,
  user:
},
{
  name: "Pyrokinetic",
  description: "Feeling cold during the winter? Get the ability to be the HOT one in the room.",
  category: "transformation",
  price_per_day: 5000,
  listed: false,
  user:
},
{
  name: "Communicate with animals",
  description: "Always wanted to know what your pet is complaining about? Get this power to get rid of that language barrier and converse with them!",
  category: "others",
  price_per_day: 2000,
  listed: false,
  user:
},
{
  name: "Code Whisperer",
  description: "Stuck in a code? Get the ability to summon a code whisperer, a trump card, called Stephane.",
  category: "others",
  price_per_day: 9000,
  listed: false,
  user:
},])

p "Created #{Superpower.count} Superpowers"

superpower = Superpower.create!({
  name: "Eat 100 burgers",
  description: "Want to splurge on burgers but feel too full too fast? Get the ability to eat all the burgers you want.",
  category: "superhuman",
  price_per_day: 1200,
  listed: true,
  user:
})

rentee = User.create!(email: "first-rentee@onepunchman.com", username: "test-rentee", password: 123456)
Booking.create!([{
  start_date: Date.today,
  end_date: Date.today + 3,
  status: "accepted",
  superpower: superpower,
  user: rentee
},
{
  start_date: Date.today,
  end_date: Date.today + 10,
  superpower: superpower,
  user: rentee
}])

p "Created #{Booking.count} Booking(s)"

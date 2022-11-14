Superpower.destroy_all
User.destroy_all

user = User.create!(email: "first-user@onepunchman.com", password: 123456)

Superpower.create!([{
  name: "Eat 100 burgers",
  description: "Want to splurge on burgers but feel too full too fast? Get the ability to able yourself to eat all the burgers you want.",
  category: "Superhuman",
  price_per_day: 1200,
  user:
},
{
  name: "Sleep with eyes open",
  description: "Tired of being called out in class or your job? Get the ability to sleep with your eyes open!",
  category: "Superhuman",
  price_per_day: 5000,
  user:
},
{
  name: "Electricity Manipulation",
  description: "Lost electrity in your area? Get the ability to be a hero and light up the whole town.",
  category: "Elemental",
  price_per_day: 2800,
  user:
},
{
  name: "Body Bulk",
  description: "Got a date and want to impress? Get this ability to bulk up without going to the gym",
  category: "Transformation",
  price_per_day: 3000,
  user:
},
{
  name: "Invisibility",
  description: "Want to know if your co-workers or friends are talking about you behind your back? Get the ability to become invisible and eavesdrop.",
  category: "Others",
  price_per_day: 8000,
  user:
}])

p "Created #{Superpower.count} Superpowers"

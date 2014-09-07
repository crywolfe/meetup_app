# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

test_user = User.create(
  first_name: "Gerald",
  last_name: "Wolfe",
  role: "Organizer",
  group_name: "Fun"

)
test_user = User.create(
  first_name: "Gerald",
  last_name: "Wolfe",
  role: "Organizer",
  group_name: "Happy"

)

test_group = Group.create(
  name: "Fun"
)
test_group = Group.create(
  name: "Happy"
)

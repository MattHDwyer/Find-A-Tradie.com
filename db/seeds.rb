# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Trade.create ([
  { trade_name: "Electrician", trade_description: "fixing your wiring etc" },
  { trade_name: "Plummer", trade_description: "water etc" },
  { trade_name: "Painter", trade_description: "color etc" },
  { trade_name: "Driver", trade_description: "drive etc" },
])

Role.create ([
  { privilege: "admin", role_description: "highest level user" },
  { privilege: "tradies", role_description: "highest level user" },
])

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Trade.create ([
  { trade_name: "Electrician", trade_description: "fixing your wiring etc" },
  { trade_name: "Plumber", trade_description: "water etc" },
  { trade_name: "Painter", trade_description: "color etc" },
  { trade_name: "Tiler", trade_description: "drive etc" },
  { trade_name: "Gardener", trade_description: "drive etc" },
])

role = [
  {
    privilege: "Admin",
    role_description: "Administrator that has all rights and access to the site",
  },
  {
    privilege: "Premium User",
    role_description: "Has paid a subscription and has access to premium features of the site",
  },
  {
    privilege: "Standard User",
    role_description: "Has access to basic features of the site",
  },
]

role.each do |role|
  Role.create!(role)
end
puts "SEEDED Roles SUCCESSFULLY"

# contact = [
#   {
#     email: "spencerst@email.com",
#     mobile_number: "0000 000 000",
#     landline_number: "00 0000 0000",
#     full_address: "120 Spencer Street, Melbourne VIC",
#   },
#   {
#     email: "blackburn@email.com",
#     mobile_number: "0000 000 000",
#     landline_number: "00 0000 0000",
#     full_address: "14 Station Street, Blackburn VIC",
#   },
#   {
#     email: "bendigo@email.com",
#     mobile_number: "0000 000 000",
#     landline_number: "00 0000 0000",
#     full_address: "23 Wills Street, Bendigo VIC",
#   },
#   {
#     email: "ringwood@email.com",
#     mobile_number: "0000 000 000",
#     landline_number: "00 0000 0000",
#     full_address: "14 Albert Street, Ringwood VIC",
#   },
#   {
#     email: "burwood@email.com",
#     mobile_number: "0000 000 000",
#     landline_number: "00 0000 0000",
#     full_address: "53 Elgar Road, Burwood VIC",
#   },
#   {
#     email: "mounteliza@email.com",
#     mobile_number: "0000 000 000",
#     landline_number: "00 0000 0000",
#     full_address: "189 Mount Eliza Way, Mount Eliza VIC",
#   },
#   {
#     email: "warragul@email.com",
#     mobile_number: "0000 000 000",
#     landline_number: "00 0000 0000",
#     full_address: "12 Henshall Street, Warragul VIC",
#   },
#   {
#     email: "boxhill@email.com",
#     mobile_number: "0000 000 000",
#     landline_number: "00 0000 0000",
#     full_address: "23 Nelson Road, Box Hill VIC",
#   },
#   {
#     email: "nunawading@email.com",
#     mobile_number: "0000 000 000",
#     landline_number: "00 0000 0000",
#     full_address: "12 Luckie Street, Nunawading VIC",
#   },

# ]
# contact.each do |contact|
#   Contact.create!(contact)
# end

puts "SEEDED Contact SUCCESSFULLY"

user = [
  {
    email: "spencerst@email.com",
    password: "123456",
    role_id: 3,
  },
  {
    email: "blackburn@email.com",
    password: "123456",
    role_id: 3,
  },
  {
    email: "bendigo@email.com",
    password: "123456",
    role_id: 3,
  },
  {
    email: "ringwood@email.com",
    password: "123456",
    role_id: 3,
  },
  {
    email: "burwood@email.com",
    password: "123456",
    role_id: 3,
  },
  {
    email: "mounteliza@email.com",
    password: "123456",
    role_id: 3,
  },
  {
    email: "warragul@email.com",
    password: "123456",
    role_id: 3,
  },
  {
    email: "boxhill@email.com",
    password: "123456",
    role_id: 3,
  },
  {
    email: "nunawading@email.com",
    password: "123456",
    role_id: 3,
  },
  {
    email: "admin@email.com",
    password: "123456",
    role_id: 1,
  },
]
user.each do |user|
  User.create!(user)
end

puts "SEEDED User SUCCESSFULLY"

# bp = [
#   {
#     user_id: 1,
#     contact_id: 1,
#     business_profile_description: "Spencer Street Tradie",
#     australian_business_number: "000 000 000",
#   },
#   {
#     user_id: 2,
#     contact_id: 2,
#     business_profile_description: "Blackburn Tradie",
#     australian_business_number: "000 000 000",
#   },
#   {
#     user_id: 3,
#     contact_id: 3,
#     business_profile_description: "Bendigo Tradie",
#     australian_business_number: "000 000 000",
#   },
#   {
#     user_id: 4,
#     contact_id: 4,
#     business_profile_description: "Ringwood Tradie",
#     australian_business_number: "000 000 000",
#   },
#   {
#     user_id: 5,
#     contact_id: 5,
#     business_profile_description: "Burwood Tradie",
#     australian_business_number: "000 000 000",
#   },
#   {
#     user_id: 6,
#     contact_id: 6,
#     business_profile_description: "Mount Eliza Tradie",
#     australian_business_number: "000 000 000",
#   },
#   {
#     user_id: 7,
#     contact_id: 7,
#     business_profile_description: "Warragul Tradie",
#     australian_business_number: "000 000 000",
#   },
#   {
#     user_id: 8,
#     contact_id: 8,
#     business_profile_description: "Box Hill Tradie",
#     australian_business_number: "000 000 000",
#   },
#   {
#     user_id: 9,
#     contact_id: 9,
#     business_profile_description: "Nunawading Tradie",
#     australian_business_number: "000 000 000",
#   },
# ]

# bp.each do |bp|
#   BusinessProfile.create!(bp)
# end

# puts "SEEDED BusinessProfile SUCCESSFULLY"

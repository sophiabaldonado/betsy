# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'bcrypt'

CATEGORIES = [
  Jewelry, Craft Supplies & Tools, Home & Living,
  Art & Collectibles, Clothing, Accessories, Paper & Party Supplies,
  Bath & Beauty, Bags & Purses, Weddings, Toys & Games, Books,
  Movies & Music, Electronics & Accessories, Pet Supplies, Shoes
]

CATEGORIES.each do |cat|
  Catergory.create(name: cat)
end

USERS = [
  { username: "Mike_bb", email: "mbrady@tv.com",
  password_digest: BCrypt::Password.create("MikePassword"), merchant: true }

  { username: "Carol_bb", email: "cbrady@tv.com",
  password_digest: BCrypt::Password.create("CarolPassword"), merchant: true }

  { sername: "Alice_bb", email: "anelson@tv.com",
  password_digest: BCrypt::Password.create("AlicePassword"), merchant: true }

  { username: "Greg_bb", email: "gbrady@tv.com",
  password_digest: BCrypt::Password.create("GregPassword"), merchant: false }

  { username: "Marcia_bb", email: "mbrady@tv.com",
  password_digest: BCrypt::Password.create("MarciaPassword"), merchant: false }

  { username: "Peter_bb", email: "pbrady@tv.com",
  password_digest: BCrypt::Password.create("PeterPassword"), merchant: false }

  { username: "Jan_bb", email: "jbrady@tv.com",
  password_digest: BCrypt::Password.create("JanPassword"), merchant: false }

  { username: "Bobby_bb", email: "bbrady@tv.com",
  password_digest: BCrypt::Password.create("BobbyPassword"), merchant: false }

  { username: "Cindy_bb", email: "ccbrady@tv.com",
  password_digest: BCrypt::Password.create("CindyPassword"), merchant: false }
]

USERS.each do |user|
  Member.create(user)
end

PRODUCTS = [
  {
    name: "product1", price: 1.50, description: "I'm a cool description!",
    inventory: 3, photo_url: "", retired: false, member_id: 1
  }

  {
    name: "product2", price: 1.50, description: "I'm a cool description!",
    inventory: 1, photo_url: "", retired: false, member_id: 3
  }

  {
    name: "product3", price: 1.50, description: "I'm a cool description!",
    inventory: 50, photo_url: "", retired: false, member_id: 1
  }

  {
    name: "product4", price: 1.50, description: "I'm a cool description!",
    inventory: 0, photo_url: "", retired: false, member_id: 3
  }

  {
    name: "product5", price: 1.50, description: "I'm a cool description!",
    inventory: 1, photo_url: "", retired: false, member_id: 2
  }

  {
    name: "product6", price: 1.50, description: "I'm a cool description!",
    inventory: 101, photo_url: "", retired: false, member_id: 2
  }

]

BILLING = [
  { first_name: "Mike",   last_name: "Brady",  }
  { first_name: "Carol",  last_name: "Brady",  }
  { first_name: "Alice",  last_name: "Nelson",  }
  { first_name: "Greg",   last_name: "Brady",  }
  { first_name: "Marcia", last_name: "Brady",  }
  { first_name: "Peter",  last_name: "Brady",  }
  { first_name: "Jan",    last_name: "Brady",  }
  { first_name: "Bobby",  last_name: "Brady",  }
  { first_name: "Cindy",  last_name: "Brady",  }
]

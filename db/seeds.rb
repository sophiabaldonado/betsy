# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'bcrypt'

CATEGORIES = [
  "Jewelry", "Craft Supplies & Tools", "Home & Living",
  "Art & Collectibles", "Clothing", "Accessories", "Paper & Party Supplies",
  "Bath & Beauty", "Bags & Purses", "Weddings", "Toys & Games", "Books",
  "Movies & Music", "Electronics & Accessories", "Pet Supplies", "Shoes"
]


CATEGORIES.each do |cat|
  Category.create(name: cat)
end

USERS = [
  {
    username: "Mike_bb", email: "mbrady@tv.com",
    password_digest: BCrypt::Password.create("MikePassword"), merchant: true
  },
  {
    username: "Carol_bb", email: "cbrady@tv.com",
    password_digest: BCrypt::Password.create("CarolPassword"), merchant: true
  },
  {
    username: "Alice_bb", email: "anelson@tv.com",
    password_digest: BCrypt::Password.create("AlicePassword"), merchant: true
  },
  {
    username: "Greg_bb", email: "gbrady@tv.com",
    password_digest: BCrypt::Password.create("GregPassword"), merchant: false
  },
  {
    username: "Marcia_bb", email: "mlbrady@tv.com",
    password_digest: BCrypt::Password.create("MarciaPassword"), merchant: false
  },
  {
    username: "Peter_bb", email: "pbrady@tv.com",
    password_digest: BCrypt::Password.create("PeterPassword"), merchant: false
  },
  {
    username: "Jan_bb", email: "jbrady@tv.com",
    password_digest: BCrypt::Password.create("JanPassword"), merchant: false
  },
  {
    username: "Bobby_bb", email: "bbrady@tv.com",
    password_digest: BCrypt::Password.create("BobbyPassword"), merchant: false
  },
  {
    username: "Cindy_bb", email: "ccbrady@tv.com",
    password_digest: BCrypt::Password.create("CindyPassword"), merchant: false
  }
]

USERS.each do |user|
  User.create(user)
end

PRODUCTS = [
  {
    name: "product1", price: 1.50, description: "I'm a cool description!",
    inventory: 3, photo_url: "https://i.imgur.com/KWl6pqT.jpg",
    retired: false, user_id: 1, deleted: false
  },
  {
    name: "product2", price: 1.50, description: "I'm a cool description!",
    inventory: 10, photo_url: "https://i.imgur.com/KWl6pqT.jpg",
    retired: false, user_id: 3, deleted: false
  },
  {
    name: "product3", price: 1.50, description: "I'm a cool description!",
    inventory: 50, photo_url: "https://i.imgur.com/KWl6pqT.jpg",
    retired: false, user_id: 1, deleted: false
  },
  {
    name: "product4", price: 1.50, description: "I'm a cool description!",
    inventory: 0, photo_url: "https://i.imgur.com/KWl6pqT.jpg",
    retired: false, user_id: 3, deleted: false
  },
  {
    name: "product5", price: 1.50, description: "I'm a cool description!",
    inventory: 1, photo_url: "https://i.imgur.com/KWl6pqT.jpg",
    retired: false, user_id: 2, deleted: false
  },
  {
    name: "product6", price: 1.50, description: "I'm a cool description!",
    inventory: 101, photo_url: "https://i.imgur.com/KWl6pqT.jpg",
    retired: false, user_id: 2, deleted: false
  }
]

PRODUCTS.each do |prod|
  Product.create(prod)
end

PRODUCTCATEGORIES = [
  {
    product_id: 1 , category_id: 4
  },
  {
    product_id: 1 , category_id: 2
  },
  {
    product_id: 3 , category_id: 1
  },
  {
    product_id: 3 , category_id: 4
  },
  {
    product_id: 3 , category_id: 2
  }
]

PRODUCTCATEGORIES.each do |bridge|
  ProductCategory.create(bridge)
end



BILLING = [
  {
    first_name: "Mike",   last_name: "Brady", email: "mbrady@tv.com", cc: "4444555566667777",
    cvv: 123, billing_zip: 54321, address1: "123 Sunshine St", address2: "Suite 8", city: "Seattle", state: "WA",
    zip: 12345, user_id: 2
  },
  {
    first_name: "Carol",  last_name: "Brady", email: "cbrady@tv.com", cc: "4444555566667777",
    cvv: 123, billing_zip: 54321, address1: "123 Sunshine St", address2: "Suite 8", city: "Seattle", state: "WA",
    zip: 12345, user_id: 2
  },
  {
    first_name: "Alice",  last_name: "Nelson", email: "anelson@tv.com", cc: "4444555566667777",
    cvv: 123, billing_zip: 54321, address1: "123 Sunshine St", address2: "Suite 8", city: "Seattle", state: "WA",
    zip: 12345, user_id: 2
  },
  {
    first_name: "Greg",   last_name: "Brady", email: "gbrady@tv.com", cc: "4444555566667777",
    cvv: 123, billing_zip: 54321, address1: "123 Sunshine St", address2: "Suite 8", city: "Seattle", state: "WA",
    zip: 12345, user_id: 2
  },
  {
    first_name: "Marcia", last_name: "Brady", email: "mlbrady@tv.com", cc: "4444555566667777",
    cvv: 123, billing_zip: 54321, address1: "123 Sunshine St", address2: "Suite 8", city: "Seattle", state: "WA",
    zip: 12345, user_id: 2
  },
  {
    first_name: "Peter",  last_name: "Brady", email: "pbrady@tv.com", cc: "4444555566667777",
    cvv: 123, billing_zip: 54321, address1: "123 Sunshine St", address2: "Suite 8", city: "Seattle", state: "WA",
    zip: 12345, user_id: 2
  },
  {
    first_name: "Jan",    last_name: "Brady", email: "jbrady@tv.com", cc: "4444555566667777",
    cvv: 123, billing_zip: 54321, address1: "123 Sunshine St", address2: "Suite 8", city: "Seattle", state: "WA",
    zip: 12345, user_id: 2
  },
  {
    first_name: "Bobby",  last_name: "Brady", email: "bbrady@tv.com", cc: "4444555566667777",
    cvv: 123, billing_zip: 54321, address1: "123 Sunshine St", address2: "Suite 8", city: "Seattle", state: "WA",
    zip: 12345, user_id: 2
  },
  {
    first_name: "Cindy",  last_name: "Brady", email: "ccbrady@tv.com", cc: "4444555566667777",
    cvv: 123, billing_zip: 54321, address1: "123 Sunshine St", city: "Seattle", state: "WA",
    zip: 12345, user_id: 2
  },
  {
    first_name: "Cindy",  last_name: "Brady", email: "ccbrady@tv.com", cc: "4444555566667777",
    cvv: 123, billing_zip: 54321, address1: "123 Sunshine St", address2: "Suite 8", city: "Seattle", state: "WA",
    zip: 12345, user_id: 2
  },
  {
    first_name: "Jude",  last_name: "Queso", email: "im_the_man@boss.com", cc: "4444555566667777",
    cvv: 123, billing_zip: 54321, address1: "888 Wow Dr", city: "Costa Mesa", state: "CA",
    zip: 78787
  }
]

BILLING.each do |bill|
  Billing.create(bill)
end

def random_number
  rand(10000..99999)
end

ORDERS = [
  {
    status: "pending", confirmation_date: Time.now, order_number: random_number, user_id: 3, billing_id: 1
  },
  {
    status: "paid", confirmation_date: Time.now, order_number: random_number, user_id: 3, billing_id: 4
  },
  {
    status: "complete", confirmation_date: Time.now, order_number: random_number, user_id: 3, billing_id: 2
  },
  {
    status: "cancelled", confirmation_date: Time.now, order_number: random_number, user_id: 3, billing_id: 1
  },
  {
    status: "paid", confirmation_date: Time.now, order_number: random_number, user_id: 2, billing_id: 11
  }
]

ORDERS.each do |order|
  Order.create(order)
end

ORDER_ITEMS = [
  {
    quantity: 1, name: "product3", price: 1.50, status: "pending", order_id: 1, product_id: 3
  },
  {
    quantity: 2, name: "product5", price: 3.00, status: "pending", order_id: 2, product_id: 5
  },
  {
    quantity: 1, name: "product3", price: 1.50, status: "pending", order_id: 3, product_id: 3
  },
  {
    quantity: 1, name: "product2", price: 1.50, status: "pending", order_id: 4, product_id: 2
  },
  {
    quantity: 1, name: "product4", price: 1.50, status: "pending", order_id: 5, product_id: 4
  }
]

ORDER_ITEMS.each do |order_item|
  OrderItem.create(order_item)
end

CART_ITEMS = [
  {
    quantity: 1, product_id: 3
  },
  {
    quantity: 3, product_id: 2
  }
]

CART_ITEMS.each do |cart_item|
  CartItem.create(cart_item)
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'bcrypt'

CATEGORIES = [
  {name: "Jewelry", photo_url: "https://i.imgur.com/KWl6pqT.jpg"},
  {name: "Craft Supplies & Tools", photo_url: "https://i.imgur.com/KWl6pqT.jpg"},
  {name: "Home & Living", photo_url: "https://i.imgur.com/KWl6pqT.jpg"},
  {name: "Art & Collectibles", photo_url: "https://i.imgur.com/KWl6pqT.jpg"},
  {name: "Clothing", photo_url: "https://i.imgur.com/KWl6pqT.jpg"},
  {name: "Accessories", photo_url: "https://i.imgur.com/KWl6pqT.jpg"},
  {name: "Paper & Party Supplies", photo_url: "https://i.imgur.com/KWl6pqT.jpg"},
  {name: "Bath & Beauty", photo_url: "https://i.imgur.com/KWl6pqT.jpg"},
  {name: "Bags & Purses", photo_url: "https://i.imgur.com/KWl6pqT.jpg"},
  {name: "Weddings", photo_url: "https://i.imgur.com/KWl6pqT.jpg"},
  {name: "Toys & Games", photo_url: "https://i.imgur.com/KWl6pqT.jpg"},
  {name: "Books", photo_url: "https://i.imgur.com/KWl6pqT.jpg"},
  {name: "Movies & Music", photo_url: "https://i.imgur.com/KWl6pqT.jpg"},
  {name: "Electronics & Accessories", photo_url: "https://i.imgur.com/KWl6pqT.jpg"},
  {name: "Pet Supplies", photo_url: "https://i.imgur.com/KWl6pqT.jpg"},
  {name: "Shoes", photo_url: "https://i.imgur.com/KWl6pqT.jpg"}
]


CATEGORIES.each do |cat|
  Category.create(cat)
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
    password_digest: BCrypt::Password.create("GregPassword"), merchant: true
  },
  {
    username: "Marcia_bb", email: "mlbrady@tv.com",
    password_digest: BCrypt::Password.create("MarciaPassword"), merchant: true
  },
  {
    username: "Peter_bb", email: "pbrady@tv.com",
    password_digest: BCrypt::Password.create("PeterPassword"), merchant: true
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
    name: "Antler Mirror", price: 25.00, description: "Gold, handmade mirror frame",
    inventory: 8, photo_url: "antler-mirror.png",
    retired: false, user_id: 1, deleted: false
  },
  {
    name: "Felted Cat Bed", price: 15.00, description: "Hand dyed felt",
    inventory: 10, photo_url: "felted-cat-bed.png",
    retired: false, user_id: 3, deleted: false
  },
  {
    name: "Floral Vases", price: 8.00, description: "Ceramic handmade flowers",
    inventory: 50, photo_url: "floral-vases.png",
    retired: false, user_id: 1, deleted: false
  },
  {
    name: "African Baskets", price: 12.00, description: "hand woven baskets!",
    inventory: 40, photo_url: "african-baskets.png",
    retired: false, user_id: 3, deleted: false
  },
  {
    name: "Tassled Hammock", price: 35.00, description: "Hand dyed and woven hammock",
    inventory: 30, photo_url: "hammock.png",
    retired: false, user_id: 4, deleted: false
  },
  {
    name: "Glass Lanterns", price: 18.00, description: "Glass Lanterns!",
    inventory: 101, photo_url: "glass-lanterns.png",
    retired: false, user_id: 1, deleted: false
  },
  {
    name: "Gourd Birdhouses", price: 12.00, description: "Hand carved and painted birdhouses!",
    inventory: 101, photo_url: "gourd-birdhouses.png",
    retired: false, user_id: 3, deleted: false
  },
  {
    name: "Felted Necklace", price: 22.50, description: "Hand dyed felt necklace",
    inventory: 60, photo_url: "felted-necklace-1.png",
    retired: false, user_id: 5, deleted: false
  },
  {
    name: "Incense Holder", price: 12.50, description: "Incense holder!",
    inventory: 200, photo_url: "incense-holder-2.png",
    retired: false, user_id: 6, deleted: false
  },
  {
    name: "Macrame Plant Hangers", price: 16.00, description: "Handmade macrame plant holders!",
    inventory: 45, photo_url: "macrame-plant-hangers.png",
    retired: false, user_id: 3, deleted: false
  },
  {
    name: "Moroccan Tea Set", price: 38.00, description: "Handmade tes set!",
    inventory: 35, photo_url: "moroccan-tea-set-2.png",
    retired: false, user_id: 5, deleted: false
  },
  {
    name: "Needle Point Pillows", price: 32.00, description: "Needle Point Pillows",
    inventory: 200, photo_url: "needle-point-pillows-2.png",
    retired: false, user_id: 1, deleted: false
  },
  {
    name: "Handmade Shoes", price: 26.00, description: "Fun, handmade shoes",
    inventory: 45, photo_url: "pointy-fun-shoes.png",
    retired: false, user_id: 4, deleted: false
  },
  {
    name: "Set of Handmade Pottery", price: 35.00, description: "Hand thrown and painted pottery!",
    inventory: 80, photo_url: "pottery-1.png",
    retired: false, user_id: 2, deleted: false
  },
  {
    name: "Quartz Knobs", price: 6.00, description: "One-of-a-kind quartz knobs!",
    inventory: 35, photo_url: "quartz-knobs.png",
    retired: false, user_id: 5, deleted: false
  },
  {
    name: "Skeleton Key Chandelier", price: 55.00, description: "One-of-a-kind key chandelier",
    inventory: 12, photo_url: "skeleton-key-chandelier.png",
    retired: false, user_id: 6, deleted: false
  },
  {
    name: "Stained Glass Windchime", price: 32.00, description: "Handmade stained-glass windchime",
    inventory: 24, photo_url: "stained-glass-wind-chime-2.png",
    retired: false, user_id: 1, deleted: false
  },
  {
    name: "Butterfly Chandelier", price: 62.00, description: "Handmade butterfly chandelier",
    inventory: 16, photo_url: "butterfly-chandelier.png",
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

    cvv: 123, expiration_date: "09/16", billing_zip: 54321, address: "123 Sunshine St", address2: "Suite 8", city: "Seattle", state: "WA",

    zip: 12345, user_id: 2
  },
  {
    first_name: "Carol",  last_name: "Brady", email: "cbrady@tv.com", cc: "4444555566667777",

    cvv: 123, expiration_date: "09/16", billing_zip: 54321, address: "123 Sunshine St", address2: "Suite 8", city: "Seattle", state: "WA",

    zip: 12345, user_id: 2
  },
  {
    first_name: "Alice",  last_name: "Nelson", email: "anelson@tv.com", cc: "4444555566667777",

    cvv: 123, expiration_date: "09/16", billing_zip: 54321, address: "123 Sunshine St", address2: "Suite 8", city: "Seattle", state: "WA",

    zip: 12345, user_id: 2
  },
  {
    first_name: "Greg",   last_name: "Brady", email: "gbrady@tv.com", cc: "4444555566667777",

    cvv: 123, expiration_date: "09/16", billing_zip: 54321, address: "123 Sunshine St", address2: "Suite 8", city: "Seattle", state: "WA",

    zip: 12345, user_id: 2
  },
  {
    first_name: "Marcia", last_name: "Brady", email: "mlbrady@tv.com", cc: "4444555566667777",

    cvv: 123, expiration_date: "09/16", billing_zip: 54321, address: "123 Sunshine St", address2: "Suite 8", city: "Seattle", state: "WA",

    zip: 12345, user_id: 2
  },
  {
    first_name: "Peter",  last_name: "Brady", email: "pbrady@tv.com", cc: "4444555566667777",

    cvv: 123, expiration_date: "09/16", billing_zip: 54321, address: "123 Sunshine St", address2: "Suite 8", city: "Seattle", state: "WA",

    zip: 12345, user_id: 2
  },
  {
    first_name: "Jan",    last_name: "Brady", email: "jbrady@tv.com", cc: "4444555566667777",

    cvv: 123, expiration_date: "09/16", billing_zip: 54321, address: "123 Sunshine St", address2: "Suite 8", city: "Seattle", state: "WA",

    zip: 12345, user_id: 2
  },
  {
    first_name: "Bobby",  last_name: "Brady", email: "bbrady@tv.com", cc: "4444555566667777",

    cvv: 123, expiration_date: "09/16", billing_zip: 54321, address: "123 Sunshine St", address2: "Suite 8", city: "Seattle", state: "WA",

    zip: 12345, user_id: 2
  },
  {
    first_name: "Cindy",  last_name: "Brady", email: "ccbrady@tv.com", cc: "4444555566667777",

    cvv: 123, expiration_date: "09/16", billing_zip: 54321, address: "123 Sunshine St", city: "Seattle", state: "WA",

    zip: 12345, user_id: 2
  },
  {
    first_name: "Cindy",  last_name: "Brady", email: "ccbrady@tv.com", cc: "4444555566667777",

    cvv: 123, expiration_date: "09/16", billing_zip: 54321, address: "123 Sunshine St", address2: "Suite 8", city: "Seattle", state: "WA",

    zip: 12345, user_id: 2
  },
  {
    first_name: "Jude",  last_name: "Queso", email: "im_the_man@boss.com", cc: "4444555566667777",

    cvv: 123, expiration_date: "09/16", billing_zip: 54321, address: "888 Wow Dr", city: "Costa Mesa", state: "CA",

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
    status: "pending", total: 7.00, confirmation_date: Time.now, order_number: random_number, user_id: 3, billing_id: 1
  },
  {
    status: "paid", total: 7.00, confirmation_date: Time.now, order_number: random_number, user_id: 3, billing_id: 4
  },
  {
    status: "complete", total: 7.00, confirmation_date: Time.now, order_number: random_number, user_id: 3, billing_id: 2
  },
  {
    status: "cancelled", total: 7.00, confirmation_date: Time.now, order_number: random_number, user_id: 3, billing_id: 1
  },
  {
    status: "paid", total: 7.00, confirmation_date: Time.now, order_number: random_number, user_id: 2, billing_id: 11
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

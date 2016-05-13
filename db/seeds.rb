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
  {name: "Craft Supplies & Tools", photo_url: "https://img0.etsystatic.com/062/1/7874461/il_570xN.787131090_gd7a.jpg"},
  {name: "Home & Living", photo_url: "https://img1.etsystatic.com/059/1/10208431/il_570xN.740985501_8uhx.jpg"},
  {name: "Art & Collectibles", photo_url: "https://img0.etsystatic.com/022/0/6571804/il_570xN.485475578_6fc4.jpg"},
  {name: "Clothing", photo_url: "https://img1.etsystatic.com/104/0/6595242/il_570xN.927957047_s6q9.jpg"},
  {name: "Accessories", photo_url: "https://img1.etsystatic.com/051/0/5564587/il_570xN.692994637_2j59.jpg"},
  {name: "Paper & Party Supplies", photo_url: "https://img1.etsystatic.com/121/0/10737433/il_570xN.865103641_itdv.jpg"},
  {name: "Bath & Beauty", photo_url: "https://img0.etsystatic.com/109/0/8708016/il_570xN.950157696_5q99.jpg"},
  {name: "Bags & Purses", photo_url: "https://img1.etsystatic.com/134/0/12105512/il_570xN.1015811987_6ggw.jpg"},
  {name: "Weddings", photo_url: "https://img1.etsystatic.com/110/1/12712691/il_570xN.1013080819_sq74.jpg"},
  {name: "Toys & Games", photo_url: "https://img0.etsystatic.com/005/0/7149498/il_570xN.376036392_bda4.jpg"},
  {name: "Books", photo_url: "https://img1.etsystatic.com/047/0/9568544/il_570xN.738419205_rstq.jpg"},
  {name: "Movies & Music", photo_url: "https://img1.etsystatic.com/035/0/6222402/il_570xN.640425981_dh7i.jpg"},
  {name: "Electronics & Accessories", photo_url: "https://img1.etsystatic.com/129/1/8763836/il_570xN.862001657_emym.jpg"},
  {name: "Pet Supplies", photo_url: "https://img1.etsystatic.com/040/0/8657363/il_570xN.527417903_rg7a.jpg"},
  {name: "Shoes", photo_url: "https://img0.etsystatic.com/052/2/7222521/il_570xN.681098638_9a69.jpg"}
]


CATEGORIES.each do |cat|
  Category.create(cat)
end

USERS = [
  {
    username: "Mike_bb", email: "mbrady@tv.com",
    password_digest: BCrypt::Password.create("MikePassword"), merchant: true,
    biography: "Messenger bag chillwave viral, pinterest readymade green juice art party tumblr small batch. Kinfolk fixie iPhone kitsch brunch affogato lumbersexual cred 8-bit deep v. Cardigan health goth literally, iPhone craft beer celiac retro migas selvage yuccie normcore meditation. Kinfolk food truck humblebrag skateboard franzen semiotics, distillery yr. Knausgaard yr church-key, organic readymade hoodie quinoa art party fashion axe try-hard forage distillery leggings. Echo park occupy trust fund kale chips, organic farm-to-table cardigan. Plaid chia hoodie, migas fanny pack deep v readymade mlkshk meggings drinking vinegar banh mi sustainable post-ironic."
  },
  {
    username: "Carol_bb", email: "cbrady@tv.com",
    password_digest: BCrypt::Password.create("CarolPassword"), merchant: true,
    biography: "Shoreditch kitsch intelligentsia hella meditation. Drinking vinegar echo park cliche, single-origin coffee kogi kitsch gochujang direct trade. Quinoa drinking vinegar kinfolk brunch, lumbersexual tousled artisan dreamcatcher umami mustache hammock keffiyeh selvage kitsch gochujang. Normcore intelligentsia mlkshk art party everyday carry kinfolk church-key, lumbersexual pickled jean shorts viral. Chicharrones swag williamsburg salvia, chartreuse godard skateboard scenester vegan ethical pork belly 8-bit bitters organic disrupt. Banjo farm-to-table cray selvage, pork belly mlkshk asymmetrical. 8-bit pop-up kickstarter, kinfolk poutine squid portland beard."
  },
  {
    username: "Alice_bb", email: "anelson@tv.com",
    password_digest: BCrypt::Password.create("AlicePassword"), merchant: true,
    biography: "PBR&B pickled meditation tumblr, austin man braid church-key pitchfork normcore meggings messenger bag retro kogi pop-up. Locavore pinterest cliche messenger bag, 8-bit fingerstache skateboard tofu beard post-ironic biodiesel hoodie. Jean shorts craft beer readymade austin. Meggings hammock tilde, tote bag scenester bicycle rights ramps pickled chia blog wayfarers pitchfork williamsburg cardigan cronut. Echo park retro PBR&B, distillery lumbersexual four dollar toast kitsch waistcoat sartorial meditation cliche. Four dollar toast bespoke dreamcatcher, hammock mlkshk plaid art party cardigan tacos salvia 3 wolf moon. Freegan blue bottle four loko, slow-carb tofu taxidermy mixtape hammock wayfarers health goth artisan cronut pickled next level tousled."
  },
  {
    username: "Greg_bb", email: "gbrady@tv.com",
    password_digest: BCrypt::Password.create("GregPassword"), merchant: true,
    biography: "Tofu vice wayfarers gochujang synth fap. Tilde viral vegan, forage keytar single-origin coffee tousled hashtag migas austin. Chia locavore biodiesel aesthetic offal. Lumbersexual gentrify 8-bit narwhal. Heirloom occupy leggings kombucha scenester, direct trade craft beer squid fap jean shorts aesthetic intelligentsia blue bottle. Kickstarter next level scenester cronut irony. Tacos try-hard you probably haven't heard of them bicycle rights vegan 8-bit, YOLO taxidermy austin kitsch tofu meggings."
  },
  {
    username: "Marcia_bb", email: "mlbrady@tv.com",
    password_digest: BCrypt::Password.create("MarciaPassword"), merchant: true,
    biography: "Scratch at the door then walk away nap all day stare at the wall, play with food and get confused by dust or claws in your leg so poop in litter box, scratch the walls, yet destroy couch. Sit on the laptop stare at wall turn and meow stare at wall some more meow again continue staring or unwrap toilet paper. Meow lick the other cats chase after silly colored fish toys around the house or lick the other cats curl into a furry donut. Eat owner's food refuse to leave cardboard box intently stare at the same spot paw at beetle and eat it before it gets away, spot something, big eyes, big eyes, crouch, shake butt, prepare to pounce, or if it fits, i sits. Lick sellotape ignore the squirrels, you'll never catch them anyway stick butt in face. Chew foot. Meowing non stop for food groom yourself 4 hours - checked, have your beauty sleep 18 hours - checked, be fabulous for the rest of the day - checked! "
  },
  {
    username: "Peter_bb", email: "pbrady@tv.com",
    password_digest: BCrypt::Password.create("PeterPassword"), merchant: true,
    biography: "yet leave hair everywhere. Soft kitty warm kitty little ball of furr poop in litter box, scratch the walls and leave fur on owners clothes. Lick the other cats hunt by meowing loudly at 5am next to human slave food dispenser stare at the wall, play with food and get confused by dust and stare at wall turn and meow stare at wall some more meow again continue staring . Cat snacks poop on grasses, and flee in terror at cucumber discovered on floor eat owner's food. Stand in front of the computer screen caticus cuteicus or if it fits, i sits knock over christmas tree chirp at birds. Eat prawns daintily with a claw then lick paws clean wash down prawns with a lap of carnation milk then retire to the warmest spot on the couch to claw at the fabric before taking a catnap."
  },
  {
    username: "Jan_bb", email: "jbrady@tv.com",
    password_digest: BCrypt::Password.create("JanPassword"), merchant: false,
    biography: "Eat the fat cats food paw at your fat belly but climb leg, and nap all day make meme, make cute face, yet flee in terror at cucumber discovered on floor. Hide when guests come over inspect anything brought into the house. Need to chase tail sit by the fire hide when guests come over stick butt in face, and howl uncontrollably for no reason, and hide head under blanket so no one can see. Destroy couch as revenge meow. Stare at the wall, play with food and get confused by dust get video posted to internet for chasing red dot eat from dog's food. Groom yourself 4 hours - checked, have your beauty sleep 18 hours - checked, be fabulous for the rest of the day - checked! where is my slave? I'm getting hungry cat is love, cat is life for hopped up on catnip. Shake treat bag find something else more interesting meowzer! meowing non stop for food. Hola te quiero. Stare at ceiling light hide when guests come over, for intently stare at the same spot, but jump off balcony, onto stranger's head if it fits, i sits but hopped up on catnip."
  },
  {
    username: "Bobby_bb", email: "bbrady@tv.com",
    password_digest: BCrypt::Password.create("BobbyPassword"), merchant: false,
    biography: "Flop over thinking longingly about tuna brine play riveting piece on synthesizer keyboard but pelt around the house and up and down stairs chasing phantoms. Play time. Sniff other cat's butt and hang jaw half open thereafter swat at dog. Rub face on owner touch water with paw then recoil in horror. Meow all night having their mate disturbing sleeping humans meowzer!, curl into a furry donut. Lick the plastic bag inspect anything brought into the house you call this cat food? meow meow for please stop looking at your phone and pet me unwrap toilet paper. Peer out window, chatter at birds, lure them to mouth stick butt in face. Hola te quiero. Always hungry sit in box and swat turds around the house shove bum in owner's face like camera lens pelt around the house and up and down stairs chasing phantoms, chase ball of string. Immediately regret falling into bathtub put butt in owner's face lounge in doorway or cat is love, cat is life. Intently stare at the same spot leave hair everywhere, yet loves cheeseburgers find something else more interesting, or throwup on your pillow, but i like big cats and i can not lie."
  },
  {
    username: "Cindy_bb", email: "ccbrady@tv.com",
    password_digest: BCrypt::Password.create("CindyPassword"), merchant: false,
    biography: "The dog smells bad. Kick up litter then cats take over the world, burrow under covers, or this human feeds me, i should be a god sit on the laptop. Ears back wide eyed dream about hunting birds for chase dog then run away yet why must they do that eat from dog's food for refuse to leave cardboard box but pelt around the house and up and down stairs chasing phantoms. Jump around on couch, meow constantly until given food, . Jump launch to pounce upon little yarn mouse, bare fangs at toy run hide in litter box until treats are fed chase dog then run away or sun bathe roll on the floor purring your whiskers off. Refuse to drink water except out of someone's glass give attitude, yet i like big cats and i can not lie, but when in doubt, wash yet leave fur on owners clothes if it smells like fish eat as much as you wish. Pooping rainbow while flying in a toasted bread costume in space use lap as chair, or spread kitty litter all over house intrigued by the shower, so hiss at vacuum cleaner lounge in doorway for knock over christmas tree."
  }
]

USERS.each do |user|
  User.create(user)
end

PRODUCTS = [
  {
    name: "Floral Vases", price: 8.00, description: "Ceramic handmade flowers",
    inventory: 50, photo_url: "floral-vases.png",
    retired: false, user_id: 1, deleted: false
  },
  {
    name: "Quartz Knobs", price: 6.00, description: "One-of-a-kind quartz knobs!",
    inventory: 35, photo_url: "quartz-knobs.png",
    retired: false, user_id: 5, deleted: false
  },
  {
    name: "Stained Glass Windchime", price: 32.00, description: "Handmade stained-glass windchime",
    inventory: 24, photo_url: "stained-glass-wind-chime-2.png",
    retired: false, user_id: 1, deleted: false
  },
  {
    name: "Incense Holder", price: 12.50, description: "Incense holder!",
    inventory: 200, photo_url: "incense-holder-2.png",
    retired: false, user_id: 6, deleted: false
  },
  {
    name: "Needle Point Pillows", price: 32.00, description: "Needle Point Pillows",
    inventory: 200, photo_url: "needle-point-pillow-1.png",
    retired: false, user_id: 1, deleted: false
  },
  {
    name: "Tassled Hammock", price: 35.00, description: "Hand dyed and woven hammock",
    inventory: 30, photo_url: "hammock.png",
    retired: false, user_id: 4, deleted: false
  },
  {
    name: "Macrame Plant Hangers", price: 16.00, description: "Handmade macrame plant holders!",
    inventory: 45, photo_url: "macrame-plant-hangers.png",
    retired: false, user_id: 3, deleted: false
  },
  {
    name: "Moroccan Tea Set", price: 38.00, description: "Handmade tes set!",
    inventory: 35, photo_url: "moroccan-tea-set.png",
    retired: false, user_id: 5, deleted: false
  },
  {
    name: "Felted Cat Bed", price: 15.00, description: "Hand dyed felt",
    inventory: 10, photo_url: "felted-cat-bed.png",
    retired: false, user_id: 3, deleted: false
  },
  {
    name: "Glass Lanterns", price: 18.00, description: "Glass Lanterns!",
    inventory: 101, photo_url: "glass-lanterns.png",
    retired: false, user_id: 1, deleted: false
  },
  {
    name: "Antler Mirror", price: 25.00, description: "Gold, handmade mirror frame",
    inventory: 8, photo_url: "antler-mirror.png",
    retired: false, user_id: 1, deleted: false
  },
  {
    name: "African Baskets", price: 12.00, description: "hand woven baskets!",
    inventory: 40, photo_url: "african-baskets.png",
    retired: false, user_id: 3, deleted: false
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
    name: "Skeleton Key Chandelier", price: 55.00, description: "One-of-a-kind key chandelier",
    inventory: 12, photo_url: "skeleton-key-chandelier.png",
    retired: false, user_id: 6, deleted: false
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

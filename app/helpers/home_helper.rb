module HomeHelper
  def randomized_image
    images = ["images/african-baskets.png", "images/beard-baubles.png", "images/cat-horn.png", "images/cat-wig.png", "images/cheese-collection.png", "images/dino-heels.png", "images/felted-cat-bed.png", "images/fun-t-shirts.png", "images/glow-in-the-dark-nail-polish.png", "images/gold-necklace-and-earrings.png", "images/hammock.png", "images/knitted-beards-for-babies.png", "images/large-stuffed-animals.png", "images/macrame-plant-hangers.png", "images/pointy-fun-shoes.png", "images/spock-beaded-curtain.png"]
    images[rand(images.size)]
  end
end

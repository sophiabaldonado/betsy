module HomeHelper
  def randomized_image
    images = ["african-baskets.png",
      "antler-mirror.png",
      "butterfly-chandelier.png",
      "felted-necklace-1.png",
      "felted-necklace-2.png",
      "floral-vases.png",
      "felted-cat-bed.png",
      "glass-lanterns.png",
      "glass-lanterns-2.png",
      "gold-necklace-and-earrings.png",
      "hammock.png",
      "gourd-birdhouses.png",
      "incense-holders-1.png",
      "incense-holder-2.png",
      "incense-holder-3.png",
      "macrame-plant-hangers.png",
      "pointy-fun-shoes.png",
      "moroccan-tea-set.png",
      "moroccan-tea-set-2.png",
      "needle-point-pillow-1.png",
      "needle-point-pillows-2.png",
      "pottery-1.png",
      "pottery-3.png",
      "quartz-knobs.png",
      "skeleton-key-chandelier.png",
      "stained-glass-wind-chimes-1.png",
      "stained-glass-wind-chime-2.png"]
    images.sample(8)
    #images[rand(images.size)]
  end
end

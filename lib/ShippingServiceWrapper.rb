require 'httparty'

class ShippingServiceWrapper
  BASE_URL = "https://betsyshippingserviceapi.herokuapp.com/" #This is where our API base url will go, once we have deployed it to heroku.

  #Do we need an initializer? Do we need new instances of ShippingService OR will the fancy gem ActiveShipping take care of that for us?

  def self.get_quote(destination_info, package_info)
    #Is this a get or a post? We're not sure yet, but you must know, future smarter self! Look how great you are!

    # Sending: Country, State, City, Zip
    # Sending: Weight, Height, Weight, Units (set to imperial as 'units: :imperil')
    @quotes = HTTParty.post(BASE_URL + "shipping/search",
    body: {
      origin_info: {
        country: "United States",
        state: "Washington",
        city: "Seattle",
        zip: "98103" },
      destination_info: {
        country: "#{destination_info[:country]}",
        state: "#{destination_info[:state]}",
        city: "#{destination_info[:city]}",
        zip: "#{destination_info[:zip]}" },
      package_info: {
        weight: "#{package_info[:weight]}",
        height: "#{package_info[:height]}",
        width: "#{package_info[:width]}",
        units: :imperial
        } }.to_json)

    #should we make @quotes into an instance of ShippingService? Do we need to?
  end
end

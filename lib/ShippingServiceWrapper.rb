require 'httparty'

class ShippingServiceWrapper
  BASE_URL = "http://API_GOES_HERE" #This is where our API base url will go, once we have deployed it to heroku.

  #Do we need an initializer? Do we need new instances of ShippingService OR will the fancy gem ActiveShipping take care of that for us?

  def self.get_quote(query,)
    #Is this a get or a post? We're not sure yet, but you must know, future smarter self! Look how great you are!

    # Sending: Country, State, City, Zip
    # Sending: Weight, Height, Weight, Units (set to imperial as 'units: :imperil')
    @quotes = HTTParty.post(BASE_URL + "The rest of the url",
    body: {
      shipping_info: {
        country: "#{params[:country]}",
        state: "#{params[:state]}",
        city: "#{params[:city]}",
        zip: "#{params[:zip]}" }
      package_info: {
        weight: "#{params[:weight]}",
        height: "#{params[:height]}",
        width: "#{params[:width]}",
        units: :imperial
        } }.to_json)

    #should we make @quotes into an instance of ShippingService? Do we need to?
  end
end

require 'httparty'

class ShippingServiceWrapper
  BASE_URL = "http://API_GOES_HERE" #This is where our API base url will go, once we have deployed it to heroku.

  #Do we need an initializer? Do we need new instances of ShippingService OR will the fancy gem ActiveShipping take care of that for us?

  def self.get_quote(query)
    #Is this a get or a post? We're not sure yet, but you must know, future smarter self! Look how great you are!
    @quotes = HTTParty.get(BASE_URL + "The rest of the url").parsed_response

    #should we make @quotes into an instance of ShippingService? Do we need to? 
  end
end

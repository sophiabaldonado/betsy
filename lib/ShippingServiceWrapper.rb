require 'httparty'

class ShippingServiceWrapper
  BASE_URL = "https://betsyshippingserviceapi.herokuapp.com/"

  def self.get_quote(destination_info, package_info)

    # Sending: Origin - Country, State, City, Zip
    # Sending: Destination - Country, State, City, Zip
    # Sending: Weight, Height, Weight, Length
    thing = {
      "origin_info": {
        "country": "United States",
        "state": "WA",
        "city": "Seattle",
        "zip": "98103" },
        "destination_info": {
          "country": destination_info[:country],
          "state": destination_info[:state],
          "city": destination_info[:city],
          "zip": destination_info[:zip] },
          "package_info": {
            "weight": package_info[:weight],
            "height": package_info[:height],
            "width": package_info[:width],
            "length": package_info[:length]
            } }

    @quotes = HTTParty.post(BASE_URL + "shipping/search", headers: {"Content-Type" => "application/json", "Accept" => "application/json"},
    body: thing.to_json)


    return @quotes
  end
end

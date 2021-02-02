require 'httparty'
require 'pry'
require_relative ("../lib/bar")

class GoogleApi 


    API = "AIzaSyAaSwC5MoX0vLziJApwVjWZYHxmsdz077Y"


    def self.make_request(input)
        result = Geocoder.search(input)
        #convert to 5 decimal points
        lat = result[0].data["lat"]
        lon = result[0].data["lon"]
        round_lat = lat.to_f.round(5).to_s
        round_lon = lon.to_f.round(5).to_s
        close_bars_url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{round_lat},#{round_lon}&radius=500&types=bar&keyword=happyhour&key=#{API}"
        bars = HTTParty.get(close_bars_url)["results"]
        self.create_bar_hash_from_search(bars)
    end
    

    def self.create_bar_hash_from_search(bars)
        bars.each do |bar|
            bar_hash = {
                name: bar["name"], 
                id: bar["place_id"],
                address: bar["vicinity"],
                price: bar["price_level"]
            }
        Bar.new(bar_hash)
        end
    end
  
    def self.check_for_reviews(bar)
       url = "https://maps.googleapis.com/maps/api/place/details/json?place_id=#{bar.id}&fields=name,rating,review,formatted_phone_number&key=#{API}"
       details = HTTParty.get(url)
       bar.phone = details["result"]["formatted_phone_number"]
       bar.reviews = details["result"]["reviews"]
       Bar.happy_hour_reviews(bar)
    end

end


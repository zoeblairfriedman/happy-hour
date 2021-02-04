require 'httparty'
require 'pry'
require_relative ("../lib/bar")

class GoogleApi 


    API = "AIzaSyAaSwC5MoX0vLziJApwVjWZYHxmsdz077Y"


    def self.make_request(input)
        result = Geocoder.search(input)
        if result.length == 0 
         return nil
    end
        lat = result.first.coordinates[0].round(5)
        lon = result.first.coordinates[1].round(5)
        close_bars_url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{lat},#{lon}&radius=500&types=bar&keyword=happyhour&key=#{API}"
        bars = HTTParty.get(close_bars_url)["results"]
        if bars.length < 3
            far_bars_url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{lat},#{lon}&radius=10000&types=bar&keyword=happyhour&key=#{API}"
            bars = HTTParty.get(far_bars_url)["results"]
        end
        self.create_bars(bars, input)
    end
    

    def self.create_bars(bars, input)
        bars.each do |bar|
            bar_hash = {
                name: bar["name"], 
                id: bar["place_id"],
                address: bar["vicinity"],
                price: Array.new(bar["price_level"].to_i, "$").join(""),
                neighborhood: input
            }
        Bar.new(bar_hash)
        end
    end
  
    def self.load_reviews(bar)
       url = "https://maps.googleapis.com/maps/api/place/details/json?place_id=#{bar.id}&fields=name,rating,review,formatted_phone_number&key=#{API}"
       details = HTTParty.get(url)
       bar.phone = details["result"]["formatted_phone_number"]
       bar.reviews = details["result"]["reviews"]
       Bar.happy_hour_reviews(bar)
    end

end


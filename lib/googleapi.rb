require 'httparty'
require 'pry'
require_relative ("../lib/bar")

class GoogleApi 
    attr_accessor :zipcode

    API = "AIzaSyAaSwC5MoX0vLziJApwVjWZYHxmsdz077Y"


    # def initialize(zipcode)
    #     @zipcode = zipcode
    #     #convert zipinto lat/long
    #     self.make_request
    # end

    def self.make_request(zipcode)
        close_bars_url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=40.75080,-73.99612&radius=500&types=bar&keyword=happyhour&key=#{API}"
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


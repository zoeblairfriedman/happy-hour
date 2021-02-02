require 'httparty'
require 'pry'
require_relative ("../lib/bar")

class GoogleApi 

    API = "AIzaSyAaSwC5MoX0vLziJApwVjWZYHxmsdz077Y"
    close_bars_url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=40.75080,-73.99612&radius=500&types=bar&keyword=happyhour&key=#{API}"
    bars = HTTParty.get(close_bars_url)["results"]
    

    def self.create_bar_hash(bars)
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
end


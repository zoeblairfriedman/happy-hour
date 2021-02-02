#why does the radius break it and what can I do about it? 
#NYC works with 500m, but the rest of the world does not. 

class Api

    def self.get_bars(input)
        #check for valid zipcode here maybe?
        #also you need to hide your api key
        auth = "Bearer mP8GTWHecSg35laV_nS_phhhXktWoT9swULWlpYcdoUD_zrZFrV2kADMUzUb4ID5FRVXJprDaiaXNyw_uGsTj6KvuM6yJ7ZNDJ7zmdX24atV-L6iHo8wX_p9wV8YYHYx"
        bars_url = "https://api.yelp.com/v3/businesses/search?term=bars&location=#{input}&radius=500&limit=5"
        bars = HTTParty.get(bars_url, headers: {"Authorization" => auth})["businesses"]
        if bars.length == 5 
            self.create_bar_hash(bars)
        else
            if check_for_car
            bars_url = "https://api.yelp.com/v3/businesses/search?term=bars&location=#{input}&radius=10000&limit=5"
            bars = HTTParty.get(bars_url, headers: {"Authorization" => auth})["businesses"]
            self.create_bar_hash(bars)
            else
                abort("Sorry, no bars within walking distance! Get a car or maybe move?")
            end
        end
    end


    def self.create_bar_hash(bars)
         bars.each do |bar|
                bar_hash = {
                    name: bar["name"], 
                    url: bar["url"],
                    phone: bar["display_phone"],
                    address: bar["location"]["display_address"][0],
                    price: bar["price"]
                }
            Bar.new(bar_hash)
            end
    end

    def self.check_for_car
        puts "Oh oh, nothing within walking distance. Do you have a car?"
        input = gets.chomp
        if input == "Yes"
            true
        end
    end

end



    #then the user needs to chose a business
        #then I need to go to the url of the bar and scrape it for mentions of happy hour and the paragraph around it
        #show the user those mentions
        #do they want to call the bar to confirm this information? // #do they want to check another bar? // #do they want to exit?


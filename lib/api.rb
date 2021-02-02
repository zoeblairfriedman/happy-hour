class Api


    def self.get_bars(input)
        auth = "Bearer mP8GTWHecSg35laV_nS_phhhXktWoT9swULWlpYcdoUD_zrZFrV2kADMUzUb4ID5FRVXJprDaiaXNyw_uGsTj6KvuM6yJ7ZNDJ7zmdX24atV-L6iHo8wX_p9wV8YYHYx"
        bars_url = "https://api.yelp.com/v3/businesses/search?term=bars&location=#{input}&radius=500&limit=5"
        bars = HTTParty.get(bars_url, headers: {"Authorization" => auth})["businesses"]
        bars.each do |bar|
            bar_hash = {
                name: bar["name"], 
                url: bar["url"],
                phone: bar["display_phone"],
                address: bar["location"]["display_address"][0],
                price: bar["price"]
            }
           Bar.new(bar_hash)
           binding.pry
        end
    end
end


    #then the user needs to chose a business
        #then I need to go to the url of the bar and scrape it for mentions of happy hour and the paragraph around it
        #show the user those mentions
        #do they want to call the bar to confirm this information? // #do they want to check another bar? // #do they want to exit?


class Api


    def self.get_bars(input)
        auth = "Bearer mP8GTWHecSg35laV_nS_phhhXktWoT9swULWlpYcdoUD_zrZFrV2kADMUzUb4ID5FRVXJprDaiaXNyw_uGsTj6KvuM6yJ7ZNDJ7zmdX24atV-L6iHo8wX_p9wV8YYHYx"
        bars = "https://api.yelp.com/v3/businesses/search?term=bars&location=#{input}&radius=500&limit=5"
        five_bars = HTTParty.get(bars, headers: {"Authorization" => auth})["businesses"]
        binding.pry
    end


end



    #for each business I need an ID and a name and a url and phone number and price <-maybe make a class of bar??? 
    #then the user needs to chose a business
        #then I need to go to the url of the bar and scrape it for mentions of happy hour and the paragraph around it
        #show the user those mentions
        #do they want to call the bar to confirm this information? // #do they want to check another bar? // #do they want to exit?

#auth = "Bearer mP8GTWHecSg35laV_nS_phhhXktWoT9swULWlpYcdoUD_zrZFrV2kADMUzUb4ID5FRVXJprDaiaXNyw_uGsTj6KvuM6yJ7ZNDJ7zmdX24atV-L6iHo8wX_p9wV8YYHYx"
#reviews_url = "https://api.yelp.com/v3/businesses/4wwvIyP5m6AEYE5gRG0CAg/reviews"

#check = HTTParty.get(bars_url, headers: {"Authorization" => auth})



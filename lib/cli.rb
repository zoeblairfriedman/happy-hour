class Cli
  
    def welcome
        puts "IT'S HAPPY HOUR SOMEWHERE!"
        self.prompt_for_location
    end

    def prompt_for_location
        #would love random prompts so they change
        puts "Where are we drinking, ladies?"
        input = gets.chomp
        Api.get_bars(input)
        prompt_for_bar_selection
    end

    def prompt_for_bar_selection
        puts "Any of these sound good? Please enter a number:"
        puts "1. #{Bar.all[0].name}"
        puts "2. #{Bar.all[1].name}"
        puts "3. #{Bar.all[2].name}"
        puts "4. #{Bar.all[3].name}"
        puts "5. #{Bar.all[4].name}"

        input = gets.chomp

        if input == "1"
            Scraper.new(Bar.all[0].url)
        elsif input == "2"
            # Scraper.new(Bar.all[1].url)
        elsif input == "3"
            # Scraper.new(Bar.all[2].url)
        elsif input == "4"
            # Scraper.new(Bar.all[3].url)
        elsif input == "5"
            # Scraper.new(Bar.all[4].url)
        else
            puts "Please enter a number, 1-5 and we'll try this again..."
            prompt_for_bar_selection
        end
    end

end
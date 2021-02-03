class Cli
  
    def welcome
        puts "\n"
        puts "***********************************************".colorize(:light_magenta)
        puts "*****                                     *****".colorize(:light_magenta)
        puts "*****      IT'S HAPPY HOUR SOMEWHERE!!    *****".colorize(:light_magenta)
        puts "*****                                     *****".colorize(:light_magenta)
        puts "***********************************************".colorize(:light_magenta)
        puts "\n"
        self.prompt_for_location
    end

    def prompt_for_location
        #would love random prompts so they change
        puts "Where are we drinking???".colorize(:light_magenta)
        puts "Please enter a street address or neighborhood:"
        input = gets.chomp
        GoogleApi.make_request(input) ? prompt_for_bar_selection : bad_location
    end

    def prompt_for_bar_selection
        if Bar.all.length == 0
           bad_location
        else
            puts "\n"
            puts "Any of these sound good?".colorize(:light_magenta)
            puts "\n"
            Bar.all.each_with_index { |bar, i| puts "#{i+1} #{bar.name}, #{bar.address.colorize(:blue)} #{bar.price.colorize(:green)}" }
            puts "\n"
            puts "Please enter a number:"
            input = gets.chomp.to_i
            bar = Bar.all[input-1]
            get_reviews(bar)
            check_again?
            end
        end
    end

    def check_again?
        puts "Would you like to check one of the other bars? Yes or No?"
        input = gets.chomp
        input == "No" ? sad_hour : prompt_for_bar_selection
    end

    def get_reviews(bar)
        if GoogleApi.load_reviews(bar).length != 0
            puts "\n"
            puts "Here are all the reviews for #{bar.name} that mention the happy hour: ".colorize(:light_magenta)
            GoogleApi.load_reviews(bar).each {|review| print review.colorize(:light_blue) }
            puts "\n"
            puts "Here's the phone number if you want to follow up on prices and times: #{bar.phone}".colorize(:light_magenta)
            puts "\n"
        else
            puts "Sorry! No happy Hour mentions in their reviews, but that doesn't mean they don't have one.".colorize(:light_magenta)
            if bar.phone != nil
                puts "Here's the phone number to call and check: #{bar.phone}".colorize(:light_blue)
                puts "\n"
        end
    end

    def bad_location
        puts "Sorry, there are no results for your location. Please 'try again' or 'exit'." 
        input = gets.chomp
        input == "exit" ? sad_hour : prompt_for_location
    end

    def sad_hour
        puts "***********************************************".colorize(:light_magenta)
        puts "*****                                     *****".colorize(:light_magenta)
        puts "***** Happy drinking & make good choices! *****".colorize(:light_magenta)
        puts "*****                                     *****".colorize(:light_magenta)
        puts "***********************************************".colorize(:light_magenta)
    end

end
class Cli
  
    def welcome
        puts "IT'S HAPPY HOUR SOMEWHERE!"
        self.prompt_for_location
    end

    def prompt_for_location
        #would love random prompts so they change
        puts "Where are we drinking?"
        puts "Please enter a street address or neighborhood"
        input = gets.chomp
        GoogleApi.make_request(input)
        prompt_for_bar_selection
    end

    def prompt_for_bar_selection
        if Bar.all.length == 0
            puts "Sorry, there are no results for your location. Please 'try again' or 'exit'." 
            input = gets.chomp
            input == "exit" ? sad_hour : prompt_for_location
        else
        puts "Any of these sound good? Please enter a number:"
        Bar.all.each_with_index do |bar, i|
            puts "#{i+1} #{bar.name}"
        end
        input = gets.chomp.to_i
        bar = Bar.all[input-1]
        # We need functionality for if there's no Happy Hour— price point? Something? #we also need to be able to chose another option
        puts "Here are all the reviews for #{bar.name} that mention the happy hour: "
        GoogleApi.check_for_reviews(bar).each {|review| puts review }
        puts "Here's the phone number if you want to follow up on prices and times: #{bar.phone}"
        end
    end

    def sad_hour
        abort("Happy drinking & make good choices!")
    end

end
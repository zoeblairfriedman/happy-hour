class Cli
  
    def welcome
        puts "IT'S HAPPY HOUR SOMEWHERE!"
        self.prompt_for_location
    end

    def prompt_for_location
        #would love random prompts so they change
        puts "Where are we drinking?"
        input = gets.chomp
        GoogleApi.make_request(input)
        prompt_for_bar_selection
    end

    def prompt_for_bar_selection
        puts "Any of these sound good? Please enter a number:"
        Bar.all.each_with_index do |bar, i|
            puts "#{i+1} #{bar.name}"
        end
        input = gets.chomp.to_i
        bar = Bar.all[input-1]
        puts "Here are all the reviews for #{bar.name} that mention the happy hour: "
        GoogleApi.check_for_reviews(bar).each do |review|
            puts review
        end
        puts "Here's the phone number if you want to follow up on prices and times: #{bar.phone}"
    end


end
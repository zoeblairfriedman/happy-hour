class Cli
  
    def welcome
        puts "IT'S HAPPY HOUR SOMEWHERE!"
        self.prompt_for_location
    end

    def prompt_for_location
        #would love random prompts so they change
        puts "Where are we drinking?"
        input = gets.chomp
        Api.get_bars(input)
        prompt_for_bar_selection
    end

    def prompt_for_bar_selection
        puts "Any of these sound good? Please enter a number:"
        puts "1. #{Bar.all[0].name} #{Bar.all[0].price}"
        puts "2. #{Bar.all[1].name}"
        puts "3. #{Bar.all[2].name}"
        puts "4. #{Bar.all[3].name}"
        puts "5. #{Bar.all[4].name}"

        input = gets.chomp

    
    end

end
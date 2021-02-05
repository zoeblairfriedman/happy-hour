class Cli
  
    def welcome
        puts "\n            *****      IT'S HAPPY HOUR SOMEWHERE!!    *****\n".colorize(:light_magenta)                                                                 
        puts"                                                    @#        "          
        puts"                                                    @          "          
        puts"                                                    *@@&@       "               
        puts"                                                  @@@@@@@@       "              
        puts"                                                  @@@@@@@@        "             
        puts"                                                   *&@@*           "            
        puts"                                              /@@@@@                "           
        puts"                                               @@@@@                 "          
        puts"                  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@.           "         
        puts"                    @@@@@                    @     @@@@@               "        
        puts"                      /@@@@@&               @   @@@@@@                  "       
        puts"                         @@@@@@@@@@@@@@@@@@@@@@@@@@@                     "      
        puts"                           @@@@@@@@@@@@@@@@@@@@@@@                        "     
        puts"                             @@@@@@@@@@@@@@@@@@@               "                
        puts"                               @@@@@@@@@@@@@@@                  "               
        puts"                                 #@@@@@@@@@@                     "              
        puts"                                    @@@@@%                        "             
        puts"                                     @@@                           "            
        puts"                                     @@@                            "           
        puts"                                     @@@                             "          
        puts"                                     @@@                              "         
        puts"                                     @@@                               "        
        puts"                                     @@@                                "       
        puts"                                     @@@                                 "      
        puts"                                     @@@                                  "     
        puts"                                     @@@                                   "    
        puts"                            /@@@@@@@@@@@@@@@@@@@.                           "   
        self.prompt_for_location
    end

    def prompt_for_location
        #would love random prompts so they change
        puts "                   *****  Where are we drinking???  *****".colorize(:light_magenta)
        puts "\nPlease enter a street address or neighborhood:"
        input = gets.chomp
        if GoogleApi.make_request(input) == [] 
            bad_location
        else
            prompt_for_bar_selection(input)
        end
    end

    def prompt_for_bar_selection(input)
        if Bar.all.length == 0
           bad_location
        else
            puts "\n*****  Any of these sound good around #{input}?  *****\n".colorize(:light_magenta)
            bar_array = Bar.find_by_neighborhood(input)
            bar_array.each_with_index { |bar, i| puts "#{i+1} #{bar.name}, #{bar.address.colorize(:blue)} #{bar.price.colorize(:green)}" }
            puts "\nPlease enter a number:"
            input = gets.chomp.to_i
            bar = bar_array[input-1]
            get_reviews(bar)
            check_again?(bar.neighborhood)
        end
    end

    def check_again?(location)
        prompt = TTY::Prompt.new
        input = prompt.select("Would you like to check one of the other bars?", %w(Yes No))
        puts "\n"
        input == "No" ? sad_hour : prompt_for_bar_selection(location)
    end

    def get_reviews(bar)
        if GoogleApi.load_reviews(bar).length != 0
            puts "\nHere are all the reviews for #{bar.name} that mention the happy hour: \n".colorize(:light_magenta)
            #can I colorize the words "happy hour" in the reviews? and can they be on separate lines?
            GoogleApi.load_reviews(bar).each {|review| puts review.colorize(:light_blue) + "\n"}
            phone_number(bar)
        else
            puts "\nSorry! No happy Hour mentions in their reviews, but that doesn't mean they don't have one.".colorize(:light_magenta)
            phone_number(bar)
        end
    end

    def bad_location
        prompt = TTY::Prompt.new
        puts "\n"
        input = prompt.select("Sorry, there are no results for your location.\n", %w(Try\ Again? Revisit\ Search? Exit))
        if input == "Exit" 
            sad_hour
        elsif input == "Try Again?"
            prompt_for_location
        else
            previous_search
        end
    end

    def phone_number(bar)
        if bar.phone != nil
            puts "Here's the phone number if you want to follow up on prices and times:".colorize(:light_magenta)
            puts "#{bar.phone}\n".colorize(:light_blue)
        end
    end

    def sad_hour
        prompt = TTY::Prompt.new
        input = prompt.select("What would you like to do now?", %w(New\ Search? Revisit\ Search? Exit))
        puts "\n"
        if input == "Revisit Search?"
            previous_search
        elsif input == "New Search?"
            prompt_for_location
        else
            puts "***********************************************".colorize(:light_magenta)
            puts "*****                                     *****".colorize(:light_magenta)
            puts "***** Happy drinking & make good choices! *****".colorize(:light_magenta)
            puts "*****                                     *****".colorize(:light_magenta)
            puts "***********************************************\n".colorize(:light_magenta)
        end
    end

    def previous_search
        choices = []
        Bar.all.each do |bar|
            if !choices.include?(bar.neighborhood)
                choices << bar.neighborhood
            end
        end
        if choices.length == 1
            bar_array = Bar.find_by_neighborhood(choices[0])
            revisit(choices[0], bar_array)
        else 
            puts "Which neighborhood would you like to revisit?\n".colorize(:light_magenta)
            choices.each_with_index {|place, i| puts "#{i+1}. #{place.colorize(:blue).underline}"} 
            puts "\nPlease enter a number:\n"
            input = gets.chomp.to_i
            bar_array = Bar.find_by_neighborhood(choices[input - 1])
            revisit(choices[input - 1], bar_array)
        end
    end

    def revisit(input, bar_array)
        puts "\nHere, again, are the bars near #{input}:\n".colorize(:light_magenta)
        bar_array.each_with_index { |bar, i| puts "#{i+1} #{bar.name}, #{bar.address.colorize(:blue)} #{bar.price.colorize(:green)}\n" }
        puts "\nPlease enter a number:"
        input = gets.chomp.to_i
        bar = Bar.all[input-1]
        get_reviews(bar)
        check_again?(input)
    end

end
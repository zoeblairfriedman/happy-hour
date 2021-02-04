class Cli
  
    def welcome
        puts "\n"
        puts "              *****      IT'S HAPPY HOUR SOMEWHERE!!    *****".colorize(:light_magenta)

        puts "\n"
                                                                                        
                                                                                
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
        puts "\n"
        puts "Please enter a street address or neighborhood:"
        input = gets.chomp
        GoogleApi.make_request(input) ? prompt_for_bar_selection : bad_location
    end

    def prompt_for_bar_selection
        if Bar.all.length == 0
           bad_location
        else
            puts "\n"
            puts "*****  Any of these sound good?  *****".colorize(:light_magenta)
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

    def check_again?
        prompt = TTY::Prompt.new
        input = prompt.select("Would you like to check one of the other bars?", %w(Yes No))
        input == "No" ? sad_hour : prompt_for_bar_selection
    end

    def get_reviews(bar)
        if GoogleApi.load_reviews(bar).length != 0
            puts "\n"
            puts "Here are all the reviews for #{bar.name} that mention the happy hour: ".colorize(:light_magenta)
            #can I colorize the words "happy hour" in the reviews? and can they be on separate lines?
            GoogleApi.load_reviews(bar).each {|review| print review.colorize(:light_blue) }
            puts "\n"
            puts "Here's the phone number if you want to follow up on prices and times:".colorize(:light_magenta)
            puts "#{bar.phone}".colorize(:light_blue)
            puts "\n"
        else
            puts "Sorry! No happy Hour mentions in their reviews, but that doesn't mean they don't have one.".colorize(:light_magenta)
            if bar.phone != nil
                puts "Here's the phone number to call and check: #{bar.phone}".colorize(:light_magenta)
                puts "#{bar.phone}".colorize(:light_blue)
                puts "\n"
            end
        end
    end

    def bad_location
        prompt = TTY::Prompt.new
        input = prompt.select("Sorry, there are no results for your location.", %w(Try\ Again? Exit))
        input == "Exit" ? sad_hour : prompt_for_location
    end

    def sad_hour
        puts "***********************************************".colorize(:light_magenta)
        puts "*****                                     *****".colorize(:light_magenta)
        puts "***** Happy drinking & make good choices! *****".colorize(:light_magenta)
        puts "*****                                     *****".colorize(:light_magenta)
        puts "***********************************************".colorize(:light_magenta)
    end

end
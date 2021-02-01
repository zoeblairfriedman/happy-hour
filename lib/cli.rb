class Cli
    #if you're considering using mames:
    # def initialize
    #     @user_name = ""
    # end
    # ^^ then you could ask for their name in the welcome message
    # and reset the name to use later!
    # if you want to keep track of the user, make a class for users possibly?  

    def welcome
        puts "IT'S HAPPY HOUR SOMEWHERE!"
        self.prompt_for_location
    end

    def prompt_for_location
        #would love random prompts so they change
        puts "Where are we drinking, ladies?"
        input = gets.chomp
        #do the next step
        Api.get_bars(input)
    end

end
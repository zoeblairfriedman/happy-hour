HAPPY HOUR

# DESCRIPTION:
This is a Command Line Interface application that allows user to track down Happy Hour information for bars in their vicinity.
Users are provided with up to 20 bar options with their addresses and price points——they must then select a bar to investigate for Happy Hour opportunities.
As Happy Hours can be as elusive and ever-changing as the wind, a phone number is always provided when possible for details and/or confirmation.
In major cities, bars are provided within walking distance, in smaller populations, bars are provided within driving distance. 

# SETUP:

1. To run this application, you will need a unique API key from google: https://developers.google.com/places/web-service/get-api-key
2. In googleapi.rb you will need to swap in your API key as a string at the constant variable, API

# INSTALLATION:

To run this application in your local environment, please follow these steps:

1. Clone this repository
2. Run `cd happy-hour`
3. Run `bundle install`
4. Run `bin/run`


# EXAMPLE

              *****      IT'S HAPPY HOUR SOMEWHERE!!    *****

                                                    @#        
                                                    @          
                                                    *@@&@       
                                                  @@@@@@@@       
                                                  @@@@@@@@        
                                                   *&@@*           
                                              /@@@@@                
                                               @@@@@                 
                  @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@.           
                    @@@@@                    @     @@@@@               
                      /@@@@@&               @   @@@@@@                  
                         @@@@@@@@@@@@@@@@@@@@@@@@@@@                     
                           @@@@@@@@@@@@@@@@@@@@@@@                        
                             @@@@@@@@@@@@@@@@@@@               
                               @@@@@@@@@@@@@@@                  
                                 #@@@@@@@@@@                     
                                    @@@@@%                        
                                     @@@                           
                                     @@@                            
                                     @@@                             
                                     @@@                              
                                     @@@                               
                                     @@@                                
                                     @@@                                 
                                     @@@                                  
                                     @@@                                   
                            /@@@@@@@@@@@@@@@@@@@.                           
                   *****  Where are we drinking???  *****

Please enter a street address or neighborhood:
French Quarter, New Orleans

*****  Any of these sound good?  *****

1 The Bombay Club, 830 Conti St, New Orleans $$
2 Empire Bar, 819 Conti St, New Orleans $$$
3 Hermes Bar, 725 St Louis St, New Orleans 
4 Desire Oyster Bar, 300 Bourbon St, New Orleans $$
5 Orleans Grapevine Wine Bar & Bistro, 720 Orleans St, New Orleans $$$
6 Roosevelt Hotel Bar, 116 Roosevelt Way, New Orleans $$$
7 Good Friends Bar, 740 Dauphine St, New Orleans $
8 30°/-90°, 520 Frenchmen St, New Orleans $$
9 Bourbon Cowboy, 241 Bourbon St, New Orleans $$
10 Burgundy Bar, The Saint Hotel New Orleans, 931 Canal St, New Orleans 
11 Mr. Ed's Oyster Bar & Fish House, Bienville, 512 Bienville St, New Orleans $$
12 House of Blues Restaurant & Bar, 225 Decatur St, New Orleans 

Please enter a number:
1

Here are all the reviews for The Bombay Club that mention the happy hour: 
Relaxed vibe, excellent cocktails, and wonderful service. Eric at the bar is super personable! Food is tasty & the happy hour is unbeatable. Best spot off bourbon to get away from the noise & dive bar scene
Here's the phone number if you want to follow up on prices and times:
(504) 322-3650

Would you like to check one of the other bars? No
***********************************************
*****                                     *****
***** Happy drinking & make good choices! *****
*****                                     *****
***********************************************


# THANKS

Thanks to the Flatiron School & Cohort Leader, Annabell Wilmerding, for her patient guidance throughout this process. 
Thanks to Nick Spangler for his excellent advice.
Thanks also to James, Jinook, and Eva for their support and assistance. 


# LICENSE
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
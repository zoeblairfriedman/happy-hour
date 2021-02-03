HAPPY HOUR

# DESCRIPTION:
This is a Command Line Interface application that allows user to track down Happy Hour information for bars in their vicinity.
Users are provided with up to 20 bar options with their addresses and price points——they must then select a bar to investigate for Happy Hour opportunities.
As Happy Hours can be as elusive and ever-changing as the wind, a phone number is always provided when possible for details and/or confirmation.
In major cities, bars are provided within walking distance, in smaller populations, bars are provided within driving distance. 

# SETUP:

To run this application, you will need a unique API key from google: https://developers.google.com/places/web-service/get-api-key
In googleapi.rb you will need to swap in your API key as a string at the constant variable, API

# INSTALLATION:

To run this application in your local environment, please follow these steps:

1. Clone this repository
2. Run `cd happy-hour`
3. Run `bundle install`
4. Run `bin/run`


# EXAMPLE

***********************************************
*****                                     *****
*****      IT'S HAPPY HOUR SOMEWHERE!!    *****
*****                                     *****
***********************************************

Where are we drinking???
Please enter a street address or neighborhood:
529 w 29th st New York, NY

Any of these sound good?

1 Porchlight, 271 11th Ave, New York $$$
2 Bar Belly, 14 Orchard St, New York $$
3 Reunion, 357 W 44th St, New York $$
4 Bua, 122 St Marks Pl, New York $$
5 Punch Bar & Grill, 913 Broadway, New York $$
6 STITCH Bar & Lounge, 247 W 37th St, New York $$
7 Art Bar, 52 8th Ave, New York $
8 Cask Bar & Kitchen, 167 E 33rd St, New York $$
9 The Bar Room, 117 E 60th St, New York $$
10 Huckleberry Bar, 588 Grand St, Brooklyn $$
11 Point Break NYC, 12 W 45th St, New York $
12 District Tap House, 246 W 38th St, New York $$
13 Ivy, 944 8th Ave, New York $$
...

Please enter a number:
3

Here are all the reviews for Reunion that mention the happy hour: 
Had a great time at this place!! The tacos are super cheap during happy hours and they are soo good (my favorite was the beef and fish tacos)! Drinks are also generously made and sold at a fair price. Overall, the theme of a surf shop is very cute. The entrance may seem sketchy at first but once you go down it’s like a whole range of seating areas to sit down and have conversations, enjoy music and eat/drink. The workers are super nice too!Went there on a Saturday night at around 9pm...they had happy hour at that time which was great.. Well drinks are 6 dollars and they also have some awesome cocktails.... The burger fries and tacos are also awesome.. You get a vibe of being in some surf bar in California which is cool too.. There are two sections in this underground restaurant, one by the bar and another area that has table service..Happy hour is very good (particularly for the area). This theme bar is a great switch-up to the high-paced environment above ground. If you take advantage of happy hour, I don't think you can leave unhappy.
Here's the phone number if you want to follow up on prices and times: (212) 582-3200

Would you like to check one of the other bars? Yes or No?
Yes

Any of these sound good?

1 Porchlight, 271 11th Ave, New York $$$
2 Bar Belly, 14 Orchard St, New York $$
3 Reunion, 357 W 44th St, New York $$
4 Bua, 122 St Marks Pl, New York $$
5 Punch Bar & Grill, 913 Broadway, New York $$
6 STITCH Bar & Lounge, 247 W 37th St, New York $$
7 Art Bar, 52 8th Ave, New York $
8 Cask Bar & Kitchen, 167 E 33rd St, New York $$
9 The Bar Room, 117 E 60th St, New York $$
10 Huckleberry Bar, 588 Grand St, Brooklyn $$
11 Point Break NYC, 12 W 45th St, New York $
12 District Tap House, 246 W 38th St, New York $$
13 Ivy, 944 8th Ave, New York $$
...

Please enter a number:
13
Sorry! No happy Hour mentions in their reviews, but that doesn't mean they don't have one.
Here's the phone number to call and check: (212) 459-9444

Would you like to check one of the other bars? Yes or No?
No
***********************************************
*****                                     *****
***** Happy drinking & make good choices! *****
*****                                     *****
***********************************************


# THANKS

Thanks to the Flatiron School & Cohort Leader, Annabell Wilmerding, for her patient guidance throughout this process. 
Thanks to Nick Spangler for his excellent advice.
Thanks also to James, Jinook, and Eva for their support and assistance. 

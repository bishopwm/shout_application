
###########  SHOUTER: THE FINAL BOSS  ##################


=begin

Trumpets are playing, a choir is singing, and a really handsome TV presenter is introducing all you to… THE BIG EXERCISE!

But don’t be scared. It’s just a bigger exercise than normal, using all the useful stuff we learned this week: 
 - testing with RSpec, 
 - TDD methodology,
 - Sinatra,
 - ERB, and 
 - ActiveRecord. 

Quite a lot for being just the second week!

Let’s go back to 2006. Jack Dorsey, then an undergraduate student at New York University, had introduced a first draft of Twitter (then
twtr) to a bunch of guys from Odeo, and ended up implementing it as an internal service for that company. Later on, in the summer, Twitter
was released to the public. The rest is history, and by the way Mr Dorsey founded another company called Square (squareup.com).

Do you know how he implemented Twitter, though? YEAH. AHA. With Ruby on Rails.

So now we will put on the “I am Jack Dorsey” hat, and will use Sinatra to implement a first version of our web application.
We will call it… SHOUTER, because we are THAT cool.

The rest will be pretty much an early version of Twitter.


# ----------------------------- Iteration 1 ----------------------------- #

Users should be able to log in with a unique username and password. 
Once logged in, they can send "Shouts". 

 We've created the first two classes for you: User and Shout (in the skeleton). 
 - A User has a name, handle, and password. 
 - set some validations for the user model
 - The handle and password must be present and unique.
 - When the user registers, generate a password for them. It should be 20 random characters.
 - You can hard code the first few users or create them with Pry
 - A Shout is a message that with a maximum of 200 characters.
 - A Shout also has likes, which must be an integer and cannot be less than 0
 - A Shout must be related to a User
 - A User can have many Shouts but a Shout can only have one User. 
 - Make sure you save the "user_id" for each shout.
 - Add the necessary validations

Create the main page
 - it should have a form to create Shouts
 - the form should have a field for the message, a field for the user handle
 - the main page should list all of the Shouts in the order they're created
 - the Shouts should display the user handle and the message

Start with tests!
 - some examples of tests for the first iteration are included in the skeleton.
 - write the rest of the tests for Iteration 1 before implementing it
 - write the tests for each iteration before you start implementing the features

# ----------------------------- Iteration 2 ----------------------------- #

Only logged in users can Shout
 - make a log-in form for users with handle and password
 - set a session to remember the user when they log in
 - clear the session when they log out
 - only users who are logged in can submit a Shout
 - remove the handle field from the Shout input form
 - get the user handle for each Shout from the session data

# ----------------------------- Iteration 3 ----------------------------- #

Add likes
 - add a button for each Shout that when clicked, adds one like to the count 
 and redirects to '/'
 - The Shouts should display how many likes they have
 - Add a route for '/best' that shows the Shouts in order of the number of likes

# ----------------------------- Iteration 4 ----------------------------- #

User handles
 - add a route for '/:handle' where you can see the Shouts for any given user
 - on the home page, make each users' handle a link to their page

# ----------------------------- Iteration 5 ----------------------------- #

User signup
 - add a form to create new users
 - add a Top Handles page where you can see the users who have the most 
 cumulative likes from all their Shouts

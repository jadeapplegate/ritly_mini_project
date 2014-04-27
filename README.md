##Ritly

You are going to build a url-shortening app similar to [Bitly](https://bitly.com/), called Ritly. The challenge is going to be understanding the flow of control in a Rails app.  

####Description of App

* Visitors to Ritly will be able to request a randomly generated code for their URL link and save it to the database.  

* Visitors to Ritly can go to localhost:3000/go/random_generated_code and the application will redirect them to the matched link in the database.  

* Visitors to Ritly can go to localhost:3000/go/random_generated_code/preview and preview the URL to which they would be redirected.  

####Instructions

We are going to stimulate your understanding of Rails through experience. With the description and demo above, build Ritly. Use the hints below to help you create the app.

####Here are a few hints.

**The URLs Table**  



|id |            link             | random_string|               created at              |             updated at             |
|---|-----------------------------|--------------|---------------------------------------|------------------------------------|
|1  | http://www.generalassemb.ly |  m1gpLHq8aoY | Wed, 19 Jun 2013 21:23:30 UTC +00:00 |Wed, 19 Jun 2013 21:23:30 UTC +00:00|
|2  | http://www.google.com       |  T7DViXiIxFE | Wed, 19 Jun 2013 21:25:32 UTC +00:00 |Wed, 19 Jun 2013 21:25:32 UTC +00:00|
|3  | http://www.bustedtees.com   |  pxMpvdB8LRw | Wed, 19 Jun 2013 21:23:30 UTC +00:00 |Wed, 19 Jun 2013 21:23:30 UTC +00:00|

Using the above table description you should be able to answer the following questions for yourself:

* What is the name of the table above?
* Knowing the name of the table what should the model be called?
* What attributes will your model have?
* Which of these columns are automatically generated for every model?

After you create your `URL` model validate the presence of the `link` attribute and that the link has at least three characters.

**Note: remember to use postgres as your database**

## **The Routes**  
Think about the different pages and actions that exist on Ritly.  

- Make sure you have a root
- Allow new URLs to be created and displayed
- URL redirection and URL previewing are separate actions
- Make sure you know the purpose of every entry in the result of `rake routes`
- An edit route for the url submitted. The edit route should let you change the link for the URL.


## **The Views**  

*show.html.erb*  

* Visitors are redirected to the show page after they request a randomly generated code for their URL link.
This view will display the random code that was generated: "Your code is: random_code" Go to localhost:3000/go/random_code to visit your URL.


### **Generating a Random String**  

Use [`SecureRandom.urlsafe_base64(length_of_string)`](http://ruby-doc.org/stdlib-2.1.0/libdoc/securerandom/rdoc/SecureRandom.html#method-c-urlsafe_base64).  `length_of_string` is literally just meant to be the length of some string, used to help you generate a random string.  Read the above documentation if you have any questions.



### Testing

* Test each route to check for a `200` status (`expect(response.status).to be_success` or `expect(response.status).to eq(200)`) and that it renders the correct template.

* Add some model specs that test your validations.

## **Bonus:**  

* Make the preview page/url show page display the number of times someone has used that redirect.
* Want to DRY up your views by using partials? Take a look [here](http://guides.rubyonrails.org/layouts_and_rendering.html#using-partials) (try to make this a habit).

* Allow a user to create a custom redirect string, like `my_string`, that will then be used for the shortened string, e.g. `localhost:3000/go/my_string` redirects to their url. Make sure to think about possible problems this could cause.

* Make the preview page contain a preview of the content at the url, not just the target url. (Note this is intentionally vague, because it's hard and you'll have to get creative and be resourceful.)

* Research regular expressions and add a validation using regular expression for the `URL` link. (*HARD*)

## Challenge
* Make everything gorgeous.


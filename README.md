# README

<h2>Description</h2>

* You are to design, build, deploy and present a Ruby on Rails application (App).

* You must build a two sided marketplace. This App will cater to two markets that your app brings together. For example,

Ebay with buyers & sellers
AirBnB with travellers & house owners
Uber with travellers & drivers
Some suggested starting ideas,

A tutor marketplace helping uni students find other uni students to help them with their study.

A recruitment tool to profile candidates to employers.
Or you can build any two-sided marketplace you like. (Keep it simple!)
The project is to be completed in assigned groups.

<h3>You must complete both the Technical (Section 2.1) and Short Answer (Section 2.2) requirements specified below </h3>

<strong>2.1 Requirements - Technical</strong>
Demonstrate your Ruby on Rails development skills by implementing the following requirements,

Create your App using Ruby on Rails.
Use Postgresql database in development and production.

Your App< will have authentication (eg. Devise).
Your App will have authorisation (i.e. users have restrictions on what they can see and edit).

Your App will have some type of file (eg. images) uploading capability.
Implement a payment system for your product. (e.g. Stripe).
Use appropriate gems.
Your application is to be deployed to Heroku (recommended) or AWS.
Optional features,

Use an API (e.g. Omniauth, Geocoding, Maps, etc).
Transactional emails (eg. using Mailgun).
Searching, sorting and/or filtering capability.
Internal user messaging system within the App.
Admin dashboard for the admin user to administer the site.

<strong>2.2 Requirements - Short Answer</strong>
Questions
To demonstrate your knowledge you are required to answer a set of short questions. In your README.md file create a heading for each of the questions below and provide answers inline,

<h4> What is the need (i.e. challenge) that you will be addressing in your project? </h4>
<p> The challenege that we looked to address in this project was helping people find tradesmen. We wanted to create a yellow pages type site that, but rather than companies just putting their information up and allowing users to search for them, we wanted users to also have an input. We have a ratings system on the site so that users can find not just any tradesmen, but the best tradesmen in their local area.</p>

<p> <strong>a. team management</strong> </p>

work in a team of three people; make sure members know the team objective and his own task objective; effective communication through slack; managing task dependencies in team (for example, the project is created by a member and he keeps the master key but other members from time to time to need to use that master to configure credential file and develop some feature for the app); working on top other people's work (modify the design, and refactoring other people's code) </p>

<p> <strong>b. app development/coding challenge</strong> </p>

<p> <strong>Create dynamic search bar hint</strong></p>

One of the key feature of the app is to allow user to search tradie within a specified post code area. 

To assist the search, dynamic search hints are provided after the user enter the information. (The app will look for the business name, trade type, and business description and return information based what a user input). This requires us to study and use a little bit of javascript.

<p><strong>Location-based search</strong></p>

As mentioned above, to search for a tradie within an area specified by the user. Our code needs to:

* store evaluate the trade's location
* store evaluate the searcher's location
* return a result that satisfy the criteria set up by the people who use the search function

This requires us to study and understand 

a. the logic behind any location based serach function

b. and to use gem 'geolocation' and Google API.



<p><strong> Allow user to do crud operation on his/her profile/pages</strong></p>


Like most web app, an anthorised User can perform CRUD operation on different pages.

In our case, a tradie can create, edit and delete his business profiles and manage the listing in his dashboard. Besides, he can add/manage business logo and project photos in specific profile and reply to any comment, an external view leave to his profile.

A user can view the business profile and leave the comment.

These CRUD operation can be done as designed require us carefully manages the instance variables and related params across the different pages is somehow chanllenging. And the whole process is complicated by the fact that we use scaffold genereated form partial in many cases.


<h4> Identify the problem you’re trying to solve by building this particular marketplace App? <h4>

<p> The problem we're trying to solve, is to help people weed out the good and bad tradesmen. There's a small issue in Australia of tradesmen overpricing for their work and for the results to be terrible. By adding reviews and the chance for tradesmen to show off their own work, we hope this inspires the competitiveness in the industry and increases the standard of work completed. </p>

The app is targeted to the people who want to use a simple and user-friend website to look for tradesmen information to get their household/business jobs done. 

In Australian market, there are three types of websties serving this group of people.

Yellow Pages like Websites: Yellow pages, True locals, or white pages. 

Quotes seeking website Websites: Hipages, Oneflares, Seekingservice.

P2P quotes seeking site: Airtaskers.

Drawbacks of these site:

1. Most of them are heavily quote oriented. Meaning user needs to give away too many form details in order to be able to see a business list generated by system (Airtasker, seekingservice, hipages etc) and can easily get confused and lose the patience of using that site. 

2. The filtering/sort function of the business directory (index) page is not user friendly. For example, in Yellow Pages, You can do sort by relavnce, distance but not the rating/reviews. In Seekservice, you can filter or sort ratings/review number but you cannot filter by distance.



* Why is it a problem that needs solving?

<p> This is a problem that needs solving, because you can't be having people spending thousands and thousands of dollars on work around their house/business and being ripped off by people that are just out here to earn a quick buck. We want tradesmen to be held accountable for their work, as well as making sure the Australian people get good value for their money.</p>

<h4> Describe the project will you be conducting and how. your App will address the needs </h4>

<p> We've created a search engine for users, so that they can find local tradesmen in their area. Users will input the type of trade they're looking for (which is provided by the site, they can only look for trades that are already provided) and also their location. 
<br>
The home page of the site will send the users straight to the search function. There will also be options for tradesmen to create an account and to sign up to the site, so that they can post their business. </p>

<h4> Describe the network infrastructure the App may be based on. </h4>

The site will be deployed onto Heroku. Heroku links with GitHub and passes the necessary code to be able to deploy the site. Heroku is a free service that allows users to store their code on a server so that when a user initiates a HTTP 'Get' Request for their site, the HTTP Response is the code that the developer has created.


<h4> Identify and describe the software to be used in your App. </h4>
Frameworks:
* Ruby on Rails: A web-application framework written in ruby in conjunction with rails to create full-stack web applications. Ruby on Rails is a MVC (Model, View, Controller) framework that emphasises convention over configuration. Rails assists with the automation of time consuming code, when creating such things as routes, controllers, views and database migrations.

Databases:
* Postgres: A Relational Databse management system
* Active Record: An ORM or Object Relational Mapping tool, which provides an interface between the tables in a  relational database.

Version Control:
* GitHub: GitHub is a source control tool which is allows for either solo or group projects to be developed.

Deployment:
* Heroku: Allows you to deploy web applications. It allows you to push directly from Gitub in a variety of different languages. 


<h4> Identify the database to be used in your App and provide a justification for your choice. </h4>
<p> We've decided to use a POSTGRESQL database for our site. The reason for this decision was because the deployment site that we're using (heroku) works best with POSTGRESQL databse sites. </p>

<h4> Identify and describe the production database setup (i.e. postgres instance). </h4>
When we "rails new"'d for the first time, we added "-d postgresql". This created a local instance of a POSTGRESQL database. We then in the terminal, created the database with the code "rails db:create". After creating the database we were then able to run migrations through the database to create the tables via

<h4> Describe the architecture of your App. </h4>

<h4> Explain the different high-level components (abstractions) in your App. </h4>

App is deployed in the website Heroku.
The web framework we use is Rails 5.2.3.
Front End Language we use is : HTML with embedded Ruby. A little bit of javascript.
Styling language: Pure CSS and CSS Library bootscrap.
A payment system: Stripe

<h4> Detail any third party services that your App will use. </h4>

    * AWS for storing the photos 
    * Stripe to manage the payment windows
    * GeoCoder Gem: Utilises the Google Map/Earth API to provide the address/location information


<h4> Describe (in general terms) the data structure of marketplace apps that are similar to your own (e.g. eBay, Airbnb). </h4>

Essentially, our purpose is to have a more user friendly version of yellow pages that focuses on the tradesmen industry. Therefore, site like Yellow Pages or Yelps will be definitely similar but much more complex than our site. Our site aims to be more simplistic than these sites and aims to have more of a user feedback than these sites may have.


<h4> Discuss the database relations to be implemented. </h4>

** insert screenshot of ERD



<h4> Describe your project’s models in terms of the relationships (active record associations) they have with each other. </h4>

** insert picture of ERD ** 



<h4> Provide your database schema design. </h4>

Pic

<h4> Provide User stories for your App. </h4>

A visitor wants to look for a plumber to fix leakage problem of his sink tap. He comes to our site and enter his home location and quickly do a search. He finds a list of 100 plumbers within 10 km of his home. Then he narrows down the distance to 5km and sorts the lists based on the average rating of the business and finds the photos of that plumber's past projects. He carefully reads the comments left by other customer of that tradie. After he feels confident, he calls that tradie, arrange a job to him.

A tradie wants to adverstise his own business on internet. He just wants to use a cheap and no frill website to publish his business profile. He is happy to pay a small amount of money to list his profile for a period of one month, three month or a year. 

In his profile, he wants to add descriptions and photos to his business. He also likes to see customer's feedback on his business and willing to give response to the customer's comments. 



<h4> Provide Wireframes for your App. </h4>

Pic


<h4> Describe the way tasks are allocated and tracked in your project. </h4>

Discuss the project idea for first and half days.
Wireframe design and completed in day2 and day3.
Preliminary design is completed in day 4.

Team then split into two part:
1. two people reasearch on the features we want have
2. one person focuses codes the actual view pages.

Each day morning, discuss the progress so far. And lists the target we have in the trello board. 

Each night, the code is pushed into the github and a second person will merge his code into the github master file. 



<h4> Discuss how Agile methodology is being implemented in your project. </h4>

Our code development starts when the framework is done.
When we are fine tuning the details of design. The view pages have been already finished based on the wireframe of the prelimary design.

As long as the research of the new features are completed, we updated our existing code and let the new feature incorporated into our design. Then we do basically styling after each function can be achieved.


<h4> Provide an overview and description of your Source control process. </h4>

TBD

<h4> Provide an overview and description of your Testing process. </h4>

TBD

<h4> Discuss and analyse requirements related to information system security. </h4>

TBD

<h4> Discuss methods you will use to protect information and data. </h4>

TBD

use strong params for almost every data input.
use pundit gem to set up the policy. 




<h4> Research what your legal obligations are in relation to handling user data. </h4>

TBD

Good luck! & Have fun :)
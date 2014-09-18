#Zurb Foundation 5
*Disclaimer: If you don't care about a Twitter Bootstrap alternative, that's totally cool and I won't hold it against you if you're working on your project 3 quietly, while we're covering this lesson.*

##Quickstart
Adding the foundation framework to your new rails application is as easy as adding this line to your *Gemfile*:

    gem 'foundation-rails'
    
Run a **bundle install**, followed by

    rails g foundation:install

##Templates

Templates can give you a quick starting point and make sure, that you don't get too crazy and come up with something a user hasn't already seen. Zurb provides Foundation templates utilizing their grid system. Check out this page: 
[http://foundation.zurb.com/templates.html](http://foundation.zurb.com/templates.html)


##Components
The "[Kitchen Sink](http://foundation.zurb.com/docs/components/kitchen_sink.html)" gives you an overview of the elements that are being shipped with Zurb Foundation 5.

<br/><hr/>

##Exercise
Display (cat) images (the image-location should come in from an API) in an Orbital Slider that is embedded in an accordion. Have another accordion display another Orbital Slider and images from another category (maybe dog photos).

<br/><hr/>

##What's different (for now)?
[Top 5 Core Differences Between Bootstrap 3 and Foundation 5](https://medium.com/@felippenardi/top-5-core-differences-between-bootstrap-3-and-foundation-5-8b3812c7007c)

##Brace yourself! Change is coming.
Zurb has announced some major changes. They are shying away from the common 12-*ish*-column grid-system (which they are currently using). As they're somewhat corporate-like, they don't have a public GitHub system with a dev-branch, but you can give them your Name and Email and maybe you'll get some insights if Twitter Bootstrap is too mainstream (or too well supported) for you:
[http://zurb.com/article/1333/foundation-a-new-grid](http://zurb.com/article/1333/foundation-a-new-grid)

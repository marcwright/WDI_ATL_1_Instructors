#Heroku Deployment for Rails/Mongoid

###Checklist (Before you even think of deploying!)

- Does your app work locally? (If you have errors, they won't magically be solved by deploying to Heroku!)
- Do you have seed data/is your app equipped to add objects to your DB? (Locally-stored data won't push up.)
- Are you working from the command line **in the app directory**?

###Get yourself set up with Heroku
- If you don't already have one, head on over to [Heroku's site](http://heroku.com/ "Title") and create your own Heroku account
- After that, go ahead and download the [Heroku Toolbelt](https://toolbelt.heroku.com/) so you can access Heroku commands in your command shell
- To finish out your account verification, you'll need to go into your Heroku account settings and enter in your credit card information. You must enter this in, because even though the MongoHQ add-on that we're about to use is free, it will fail without your payment info.


###Set up a repo for your app

- go onto GitHub and create a new repository
- ```git init``` in your app directory
- ```git add -A``` and ```git commit -m "some message"``` so there's something to push
- ```git remote add origin <yourURLhere>```
- ```git push origin -u origin master``` to finish it all off

###Create your Heroku app

- ```heroku domains``` to check that you don't already have a Heroku app for this repo (if you see anything other than **!   No app specified**, you probably already have an app.)
- ```heroku create``` to create a new Heroku app (or ```heroku create myfancyapp``` to create an app with a pre-set name, in this case, *myfancyapp*)
- go ahead and double-check that business with a ```heroku domains```
- ```add``` and ```commit``` your repo if you haven't already, then ```git push heroku master```

###Set up MongoHQ

- In your terminal, type ```heroku addons:add mongohq``` (make sure the response indicates that you're on the free version -- note that the Heroku Dev Center instructions for this step direct you towards the $15/month MongoHQ level)
- Check that this step worked by running ```heroku config``` in your terminal. You should see a list of variables that includes one called **MONGOHQ_URL**


###Update your Rails app to play nice with Heroku/MongoHQ

- Subl into your project
- **Fix your mongoid.yml**
	- Add the following to your **mongoid.yml** file, making sure that it starts at the far left of a line and is indented *precisely* (.yml files won't run properly without perfect indentation): 
	
`

	    production:
	      sessions:
	        default:
	          uri: <%= ENV['MONGOHQ_URL'] %>


- **Add the rails_12factor gem**
	- Add the following to your Gemfile: ```gem 'rails_12factor'```
	- Run a ```bundle install```
	
- **(ONLY if you get an I18n error when you run rake tasks) Run the locales fix**
	- Add the line ```config.i18n.enforce_available_locales = true``` to config/application.rb  following ```class Application < Rails::Application``` (usually ~ line 15 or 16)
- **Prep your app for precompile**
	- Open **config/environments/production.rb** 
	- Set ```config.assets.compile``` to true (should be line 30 or nearby) 
	- Overwrite the Rails-default comment that reads ```# config.assets.precompile += %w( search.js )``` (should be around line 62) with ```config.assets.precompile += %w[*.png *.jpg *.jpeg *.gif] ```
	
###Get this show on the road
- **Precompile locally**
	- In your terminal, run ```RAILS_ENV=production bundle exec rake assets:precompile```
- **Add - Commit - Push**
	- Another time (following that precompile!)
	- ```git add -A```
	- ```git commit -m "precompiled assets locally"```
	- ```git push origin master```
	- ```git push heroku master```
- **Rake your seed file (if you have one)**
	- In your terminal, run ```heroku run rake db:seed``` (note: this must be done after you've pushed to Heroku, otherwise the seed file won't be recognized)
- **After you rake your seed file - Add - Commit - Push**
	- And one last time (following that seed file rake!)
	- ```git add -A```
	- ```git commit -m "precompiled assets locally"```
	- ```git push heroku master```
	
 

	
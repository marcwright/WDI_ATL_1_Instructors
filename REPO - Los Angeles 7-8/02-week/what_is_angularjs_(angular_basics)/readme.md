#ANGULAR BASICS

###What is AngularJS? / Why AngularJS?

- static HTML is boring 
- regular JS can get clunky and burdensome
- 2-way binding is dynamic and sleek - (update what you see to reflect model; update-  model based on user actions) 
- your HTML is your template
- it's "real" MVC
- your model is POJO (plain old JS objects)
- directives are a super cool way to trick out your HTML
- filters make your data look great right away (they also aren't just filters -- they're formatting, sorts, and more!)

###Models, Views, Controllers

- Models: JS objects! (hint: this is why we went over those so much)
- Views: what you see in HTML 

	(a peek at the model via the lens of the template we construct over it)
- Controllers: think of these like traffic cops or couriers

###Syntax notes

- calling directives (short version: usually these are augmented on HTML tags: see ng-app)
- double curly for binding (aka handlebars) 
	
	{{ thing }} 
	
	(tells the browser to read the evaluated expression between curlies rather than curlies as punctuation, AND to update it whenever that expression suddenly evaluates differently)

###Draw all over and replace:

- base html with html ng-app (now we're cooking!)
- no script or main.js with ng script + any js in ng style
- body with ng-controller
- ul (hardcoded) with ng-repeat

###Getting started: Angular over a basic HTML project

- ng-app in the html tag
- import angular script
- ng-model in the input tag
- {{ }} bound data

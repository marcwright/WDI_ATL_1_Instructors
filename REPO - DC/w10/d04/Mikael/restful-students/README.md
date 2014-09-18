# Restful Students

Unfortunate facts…

- We'll be dispersing in a few short weeks. =(
- **Let's stay in touch!** =)

Let's build a class contact information directory to keep eveyone in touch! (we'll need a volunteer to host it on their Heroku account.)

This is a full REST application with multiple front-end views. There are LOTS of moving pieces here. Work with a partner, or a small group. Take each step at your own pace. We've done each part of this; now we need to put al of those pieces together. Work methodically at your own pace; we'll be here to help.

Here's what to do:

## 1. Create a RESTful API

Create a `Student` model with the following fields (all strings):

- name
- email
- phone
- location
- employment

Setup all necessary resources to provide a JSON API through the "/students" route.


## 2. Explore the Front-End

The application's HTML front-end available at the root URL ("/"). **This is where you'll be building the front-end application.**

The front-end already has some HTML templates embedded within it. A preview of these templates can be seen at "/templates".

All front-end HTML resources can be found in `app/views/app`.

## 3. Create a Backbone Model

Within `assets/javascripts/students/model.js`:

- Create a Backbone "Student" Model with fields matching the backend database.

- Create a Backbone "Students" Collection. Configure it to manage Student models, and talk to the "/students" REST endpoint.

- Create an instance of the collection called `studentsCollection`. Other Backbone components will reference this instance!

## 4. Create a Students List View

Within `assets/javascripts/students/view.js`:

- Create a `StudentsListView` view class; it should create it's own "div" tag with a class of "students-list".

- Attach an Underscore template to this view class; use HTML from the "#students-list" script template tag (template available at `app/views/students/_list_template.html.erb`).

- **To preview this view:** instance it with a reference to your `studentsCollection`, and then render it into the "#students-container" element. *When you've got this view fully working, you can disable this preview instance.*

- Make this list view create new `studentsCollection` items. New items should sync with the API, and re-render the list of student links (you'll need to adjust the template!).

## 5. Create a Student Detail View

Within `assets/javascripts/students/view.js`:

- Create a `StudentDetailView` view class; it should create it's own "form" tag with a class of "student-detail".

- Attach an Underscore template to this view class; use HTML from the "#student-detail" script template tag (template available at `app/views/students/_detail_template.html.erb`).

- **To preview this view:** fetch `studentsCollection`, and then instance this view with a reference to any Student model. Render the view into the "#students-container" element. *When you've got this view fully working, you can disable this preview instance.*

- When this view renders, render it with its model's data (you'll need to adjust the view template). Have the view save form changes into its model.

## 6. Create a Router

Within `assets/javascripts/students/router.js`:

- Create a new router with routes for "students" and "student/:id".
- The "students" route should construct a new `StudentsListView` instance, and put its content into the "#students-container".
- The "students/:id" route should create a new `StudentDetailView` instance using the specified model ID, and put it into the "#students-container".

## DONE.

Congrats… now go on and help your classmates.




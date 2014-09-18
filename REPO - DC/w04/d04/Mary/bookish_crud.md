##Bookish CRUD

#### Prompt
You've been tasked with building a three-model Rails CRUD App that allows bookish types to track their favorite authors' books and characters. The model specs are as follows:

An __Author__ has many books and characters (through books), as well as the following attributes:

* name
* dob
* gender
* has_pseudonym (should default to false)

A __Book__ points back at an author, has multiple characters, and has these additional attributes:

* title
* release_date
* genre

<<<<<<< HEAD
A __Character__ can appear in one books, and has these additional attributes
=======
A __Character__ belongs to a book, and has these additional attributes
>>>>>>> 67f5e0aa5a172b85c738b690e372330f80f7b18a

* name
* gender
* quirk

Your Rails app should make use of RESTful routes, and allow you to RESTfully manage every book and character for a particular author. The RESTful actions are below:

* index
* show
* new
* create
* edit <- Will the basic info for a book or a character need updating? You make the call.
* update <- You're the client. You don't need to
* destroy

#### Instructions

1. Whiteboard an Entity Relationship Diagram (ERD) for the entities and relationships outlined above.
2. Create a new rails app called `bookish_app`
   - `rails new bookish_app -d postgresql`
3. Create a database for your app using `rake db:create`
   - use psql to make sure your database was in fact created
   - __Note:__ You'll have to be in your rails project directory to use rake db:create
4. Generate the appropriate migration files, taking into account the attributes listed above
5. Once you've written our your migration files, run `rake db:migrate` to create them in the db
6. Create your models and declare their relationships
7. Test your models in the rails console
8. Build out the controllers and views, starting with 1 set of actions (for the author model), then moving on to the actions for the second model (an author's books), then moving on to the third model (managing characters in an authors book)

#### Bonus

1. Add validations
2. The client has just realized that characters can appear in many books. Change your app and schema to accomodate this.
3. Research and make use of link helpers and form helpers

####Useful Command-Line Commands

- `rake db:create`
- `rake db:migrate`
- `rake db:seed`
- `rake db:rollback`
- `rake routes`
- `rails server` alias `rails s`
- `rails console` alias `rails c`
- `rails db`

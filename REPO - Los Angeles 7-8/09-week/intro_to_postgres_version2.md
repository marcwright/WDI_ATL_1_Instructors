#Intro to Postgres  v.2 
###(with psql and heroku commands)

<br>

This file will show you how to install a rails4 app with postgres and deploy it to Heroku. We will also discuss some psql commands and how to create backups.


##Installation:


###Step 1 - download the [postgresapp](http://postgresapp.com/)

control+click to install it in your applications folder

go to your terminal or iterm2 command line prompt and type...

	psql postgres
	
inside the postgres=# prompt type...

	CREATE EXTENSION "adminpack";
	
	CREATE ROLE rails WITH createdb login password 'rails';
	
then quit psql by typing...

	\q


For each new Rails app, go inside your database.yml file...inside the development section, as the username and password, place rails...

```
development:
  adapter: postgresql
  encoding: unicode
  database: pgtestapp_development
  pool: 5
  username: rails
  password: rails
```



###Step 2 - download and install [pgadmin3](http://www.pgadmin.org/download/macosx.php)

This is not necessary to make postgres work on your system. This is only here to provide you with a tool to view what is inside your database. NEVER use this tool to edit your database! Use rails migrations! Or you're gonna have a bad time :)


###Step 3 - create a new rails app

**New Rails4 app**

	$ rails _4.0.4_ new pgtestapp --database=postgresql
	
cd into the directory...

	$ cd pgtestapp
	
We'll do a little dirty scaffold to get our test app going.

	 $ rails generate scaffold Street name:string treetype:string
	 
edit **Database.yml**

```
development:
  adapter: postgresql
  encoding: unicode
  database: pgtestapp_development
  pool: 5
  username: rails
  password: rails
```

then at your command prompt...

	rake db:create
	rake db:migrate
	
now start your app...

	rails s
	
now open your app in chrome

	localhost:3000/street

You should see a working app with models! Enter in a few values.
	 
	NOTE: Don't forget to create a root page. Make sure you edit the routes.rb page and get your app pointing it's root to it!!
	
get git going...
		
	git init
	git add -A
	git commit -m "initial commit"	
	
##YOU'RE DONE! 

###below are some instructions for getting your app onto heroku...
	
**Heroku specific instructions:**        

	NOTE: everything from below this point will be for getting your app ready for deployment onto Heroku.	

get heroku going 

    heroku create
	
To enable features such as static asset serving and logging on Heroku add rails_12factor gem to the end of your Gemfile.

	gem 'rails_12factor', group: :production
	 
Specify specific Ruby. At the end of your gemfile add...

	ruby "2.1.2"
	
	
##Add Unicorn Webserver to your Gemfile:

Inside your gemfile

	gem 'unicorn'
	
Then run
	
	$ bundle install
	
Now you are ready to configure your app to use Unicorn.

Create a configuration file for Unicorn at config/unicorn.rb:

	$ touch config/unicorn.rb
	
Add Unicorn specific configuration options In file config/unicorn.rb:

```
worker_processes Integer(ENV["WEB_CONCURRENCY"] || 3)
timeout 15
preload_app true

before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end
```
This default configuration assumes a standard Rails app with Active Record. You should get acquainted with the different options in [the official Unicorn documentation](http://unicorn.bogomips.org/Unicorn/Configurator.html).

Finally you will need to tell Heroku how to run your Rails app by creating a Procfile in the root of your application directory.

##Add a Procfile:

	touch Procfile
	(note: the case is important!)
	
in the Procfile write:

	web: bundle exec unicorn -p $PORT -c ./config/unicorn.rb

Set the RACK_ENV to development in your environment and a PORT to connect to. Before pushing to Heroku you’ll want to test with the RACK_ENV set to production since this is the enviroment your Heroku app will run in.
	
	$ echo "RACK_ENV=development" >> .env
	$ echo "PORT=3000" >> .env
	
You’ll also want to add .env to your .gitignore since this is for local enviroment setup.

	$ echo ".env" >> .gitignore
	$ git add .gitignore
	$ git commit -m "add .env to .gitignore"
	
Test your Procfile locally using Foreman:

	$ gem install foreman

You can now start your web server by running

	$ foreman start
	18:24:56 web.1  | I, [2013-03-13T18:24:56.885046 #18793]  INFO -- : listening on addr=0.0.0.0:5000 fd=7
	18:24:56 web.1  | I, [2013-03-13T18:24:56.885140 #18793]  INFO -- : worker=0 spawning...
	18:24:56 web.1  | I, [2013-03-13T18:24:56.885680 #18793]  INFO -- : master process ready
	18:24:56 web.1  | I, [2013-03-13T18:24:56.886145 #18795]  INFO -- : worker=0 spawned pid=18795
	18:24:56 web.1  | I, [2013-03-13T18:24:56.886272 #18795]  INFO -- : Refreshing Gem list
	18:24:57 web.1  | I, [2013-03-13T18:24:57.647574 #18795]  INFO -- : worker=0 ready
	
Press Ctrl-C to exit and you can deploy your changes to Heroku:

	$ git add -A
	$ git commit -m "use unicorn via procfile"
	$ git push heroku master

Check ps, you’ll see the web process uses your new command specifying Unicorn as the web server

	$ heroku ps
	=== web (1X): `bundle exec unicorn -p $PORT -c ./config/unicorn.rb`
	web.1: starting 2014/04/17 12:55:33 (~ 1s ago)


	
At this point you can follow the normal procedure to get your app on heroku

```
git init
git add -A
git commit -m "initial commit"
```

get things set up on github....then

```
git push heroku master
```

Migrate the database on Heroku

	heroku run rake db:migrate
	
make sure the app is set to run
	
	heroku ps:scale web=1
	
open the app

	heroku open
	

**Potential Questions**

Q - How do I get my mongo data over to my postgress Rails app

A - Make a data dump from mongohq

Q - Is there anything like genghisapp for postgress?

A - yes pgadmin3

Q - can I use pgadmin to modify my database?
A - Yes but if you do so ... you're gonna have a bad time...use migrations instead.

#Even More Postgres
Below is a list of cheat sheet commands for dealing with Postgres from the psql prompt via the command line interface (cli).

##Postgres psql commands

[from iterm/terminal prompt]

change to postgres user and open psql prompt
sudo -u postgres psql postgres

**exit**
postgres=# \q

**list databases**
<br>
postgres=# \l

**list roles**
<br>
postgres=# \du

**create role**
<br>
postgres=#CREATE ROLE demorole1 WITH LOGIN ENCRYPTED PASSWORD 'password1' CREATEDB;

**alter role**
<br>
postgres=#ALTER ROLE demorole1 CREATEROLE CREATEDB REPLICATION SUPERUSER;

**drop role**
<br>
postgres=#DROP ROLE demorole1;

**drop user**
<br>
postgres=#DROP USER demorole1;

**create database**
<br>
postgres=#CREATE DATABASE demodb1 WITH OWNER demorole1 ENCODING 'UTF8';

**grant privileges to new user**
<br>
GRANT ALL PRIVILEGES ON DATABASE demodb1 TO demorole1;

**drop database**
<br>
postgres=#DROP DATABASE demodb1;

**connect to database**
<br>
\c <databasename>

**list tables in connected database**
<br>
\dt

**list columns on table**
<br>
\d <tablename>

**backup database**
<br>
pg_dump <databasename> > <outfile> 


##Postgress Backups on Heroku

heroku addons:add pgbackups:auto-week

heroku pgbackups --app APP_NAME

**Send backup dump file to Amazon S3**
<br>
heroku pgbackups:url

**Restore dump file to local machine**
<br>
(download the generated AWS s3 file from above first..place url in browser)
<br>
pg_restore --verbose --clean --no-acl --no-owner -h localhost -U <myUserName> -d <databasename> latest.dump

###Example

pg_restore --verbose --clean --no-acl --no-owner -h localhost -U aleph -d project_development a376.dump

**Destroy a backup**
<br>
heroku pgbackups:destroy BACKUP_ID

**Retrieve a backup**
<br>
heroku pgbackups:restore DATABASE 'http://location'  note single quotes important

###Setting up environment variables

Below is an example for setting environment variables on Heroku. 


```
heroku config:set PG_USERNAME=joesmith
Adding config vars and restarting myapp... done, v12
PG_USERNAME: joesmith

$ heroku config
PG_USERNAME: joesmith
OTHER_VAR:    production

$ heroku config:get PG_USERNAME
joesmith

$ heroku config:unset PG_USERNAME
Unsetting PG_USERNAME and restarting myapp... done, v13
```

###cool extras

[https://www.heroku.com/postgres](https://www.heroku.com/postgres)

####Stack Overflow assist

[http://stackoverflow.com/questions/13868730/socket-file-var-pgsql-socket-s-pgsql-5432-missing-in-mountain-lion-os-x-ser](http://stackoverflow.com/questions/13868730/socket-file-var-pgsql-socket-s-pgsql-5432-missing-in-mountain-lion-os-x-ser)

###sources

[https://devcenter.heroku.com/articles/pgbackups](https://devcenter.heroku.com/articles/pgbackups)

[http://postgresguide.com/setup/users.html](http://postgresguide.com/setup/users.html)

[https://devcenter.heroku.com/articles/getting-started-with-rails4](https://devcenter.heroku.com/articles/getting-started-with-rails4)

[https://devcenter.heroku.com/articles/config-vars#setting-up-config-vars-for-a-deployed-application](https://devcenter.heroku.com/articles/config-vars#setting-up-config-vars-for-a-deployed-application)


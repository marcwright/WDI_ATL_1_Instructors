# Private ENV Variables

## Why Env Variables?

### The problem:

We frequently have private configuration data (API keys, login credentials, etc) that we don't want to include in our project codebase that gets hosted on GitHub, because nefarious individuals can use that public information for nefarious deeds. 

### The solution

We hide this sensitive data within our host environment, and then just include references to this configuration within our project code.

## Setting it up

We're effectively just trying to add these environment variables into our bash profile; as such, we *could* just add this data into the `.bash_profile` of our user account.

However, this is putting a lot of project-specific settings into your global user configuration, which is generally bad form and can create configuration conflicts between projects. A better solution is to provision a `.env` file on a per-project basis that configures the application environment while launching it. It's easy…

### 1. Install an environment config gem

In `Gemfile`:

```
gem 'dotenv-rails', :groups => [:development, :test]
```

In bash:

```
bundle install
```

### 2. Create a ".env" file for project settings

In your root project directory, do:

```
touch .env
subl .env
```

Within your .env file, add all of your sensitive environment variables:

```
S3_BUCKET_NAME=my-private-bucket
AWS_ACCESS_KEY_ID=XXXXXXXXXXXX
AWS_SECRET_ACCESS_KEY=XXXXXXXXXXXXXXXXXXXXXXXXXXXX
```

### 3. Add ".env" to the hiden `.gitignore` file within your Rails project

Lastly, we need to tell Git to ignore our environment configuration file so that it won't be included in our repo. Again, really simple:

```
 ls -la

 # Does a file called .gitignore already exist? If not, create it!
 touch .gitignore

 # Edit the Git-ignore file
 subl .gitignore
```

Within the `.gitignore` file, add your ".env" file…

```
.env
```

### 4. Reference environment variables in your app!

You'll need to restart your Rails server. Now whenever you perform a Rake task, your environment settings will be added into the environment instance. After that, you can refence an environment variable within your Rails codebase through the `ENV` hash:

```
config.paperclip_defaults = {
   :storage => :s3,
   :s3_credentials => {
     :bucket => ENV['S3_BUCKET_NAME'],
     :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
     :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
   }
 }
```
### 5. Set up your environment variables for production

- [https://devcenter.heroku.com/articles/config-vars](https://devcenter.heroku.com/articles/config-vars)

AWS & Carrierwave
=========

## Pre
- Ensure everyone you have signed up to Amazon AWS

## Setup

```
$ git clone https://github.com/Pavling/wdi-w5d2-gallery
$ cd wdi-w5d2-gallery
$ bundle install
$ rake db:drop
$ rake db:setup
```

## Signing up

- http://aws.amazon.com/s3/
- Click "create free account"

General Assembly is going to give you $250 worth of credit on AWS, but you'll still need to provide them with credit/debit card details before you can use their services.
sign up to AWS if you haven't already you'll need a credit card (or a debit card from a credit card company e.g. Visa Debit card) once you've signed up, check your email for a GA message with a credit coupon code go to add payment method and redeem the voucher - you should now have $250 to spend on AWS services

Now we're signed up, we can get the credentials that our app needs in order to use AWS.

## Introduction to the Cloud

In this lesson, we are going to see you how we can modify the gallery app, so that it stores photos **in the cloud using Amazon Web Services (AWS)** instead of storing them locally.

- We do this to save disk space
- To speed up the delivery of the images

First, we need to sign up to AWS. Once we've done this, Amazon will give us **a secret code** that our app will have to use every time it talks to AWS.

## What exactly is Amazon Web Services?

We have all undoubtedly heard of a little company called "Amazon".

Because Amazon sees huge peaks and troughs in traffic on their website, they **don't need all of their computing infrastructure all the time**, so they decided to rent this computing out to other developers. 

This is what "Amazon Web Services", or AWS, is → a website that lets us **rent computer infrastructure** from Amazon.  

This rented infrastructure is used by millions of companies now, and AWS has become one of Amazon's biggest business areas. (It's now estimated at about 20% of Amazon's value even though it only generates about 2.9% of it's revenue).

## Tour of AWS
- Please login to AWS, http://aws.amazon.com/
- Navigate to AWS Management Console

In order to keep their services manageable, they broke their various computer systems up into discrete services that just do one thing well. We're going to use just one of these services today: ** S3 (i.e. "Simple Storage Service"). **

Let's take a quick tour of some of their other most useful services:

- **Simple Storage Service (S3)** - a huge folder for storing your files in
- **Elastic Compute Cloud (EC2)** - computers for running your website on

## S3

Now we have our account, and the codes our app will use to access our account. Let's then sign up to use S3...

- Go to **"Services"** menu item and select "**All AWS Services**" (this shows all the services we can use).
- Select **"S3"**
- Follow the instructions to enable our account to use S3
- Back in the AWS console, click on "S3" again
- We are now taken to a view that lets us manage our own personal S3 storage

### Buckets
We can think of S3 as a big bucket in the cloud, where you can dump all our files. ** Conveniently, AWS actually uses the term "**bucket**" too. **

You can create as many buckets as you like, but they **must have a globally unique name**, i.e. if any other S3 user has already used a bucket name, you won't be allowed to use that name.

### Create your first bucket

- Create a bucket now 
- Call it "wdi4-something" e.g. "wdi4-mgp" is the one I've created. 
- When asked what region, **select "Ireland"**. Generally speaking, things will be faster if you choose a region closer to your users.
- Choose **Create**

Click on your bucket, and you'll see that it is currently empty. 

### Bucket interface
You can use the online interface to create a folder within your bucket e.g. "foo". You can also use the interface to delete it again. 

Notes:
- Right click works in this interface
- Folders can have any name you want, it is only the bucket that must have a unique name


## CarrierWave + S3

Now that we have S3 set up, it's time to fix our gallery app so that it stores our pictures in the cloud. 

But why use S3 at all? 
- **Multi-server sites** - copying images to each server's public folder is difficult... and stupid
- **Security** - letting users save files on our web server is dangerous
- **Storage limitations** - our web server probably won't have much storage space

So how do we change our app to make it use the cloud...?

- - -

## FOG Steps

First, we need to install a gem that the CarrierWave gem needs in order to work with cloud services. 

**This gem is called "fog"**, and it is a very powerful gem that abstracts away all the complexity of cloud services. 

It lets us switch between rival providers relatively easily. AWS is the biggest, but there are a growing number of alternatives out there.

So, let's:

- Add the fog gem to our Gemfile `gem "fog", "~> 1.3.1"`
- `bundle install`
- `rbenv rehash` (Every time you install a new version of Ruby or install a gem that provides a command)

## Update uploader

Now, we can go to `"app/uploaders/image_uploader.rb"`.

Change the `storage :file` line to `storage :fog`. 

We're almost done - the only remaining thing to do is adding configuration info to our app, so that it can talk with AWS and use S3. 

- - -

For this, let's create an initializer in our "config/initializers folder", and call it "carrierwave.rb". 

- Create an initializer, "config/initializers/carrierwave.rb"

The CarrierWave README on github gives us an example initialiser to get started with.

Copy and paste this into our new file, and trim it down to contain:
`https://gist.github.com/alexpchin/7dbef595cdf3ef7f7873`

    CarrierWave.configure do |config|
      config.fog_credentials = {
        :provider  => 'AWS',  # required
        :aws_access_key_id  => '<your AWSAccessKeyId>',  # required
        :aws_secret_access_key  => '<your AWSSecretKey>',  # required
        :region => 'eu-west-1',  # optional, defaults to 'us-east-1'
      }
      config.fog_directory  = '<your bucket name>'  # required
      config.fog_public  = true  # optional, defaults to true
    end

And we're done! 

## Add the AWS credientials!

- Add bucket first
- Security > Credentials

### Create an access key
- Go to top right: `"(Username) or account/console" > "security credentials"`
- Read the message - we won't bother with "2 factor auth" right now
- Expand the **Access Keys** section
- Click on the **"Create new access key"** button
- Download the key file, and keep it somewhere safe

** DO NOT PUT THIS IN YOUR CLASS WORK FOLDER OR ANY OTHER FOLDER YOU SHARE WITH OTHERS
**

Suggestion: create a ".aws" directory in your home folder and put it in there.

- - -

We can now `drop the db` for the app, and recreate it. Then fire up an rails server, create a new gallery and some paintings.

Notice anything different? The pictures are now processed and uploaded to S3. We can check the S3 console to confirm.

## What about security

This raises an interesting question: If we want to share our source code (e.g. on Github)? How can we do so without also sharing the secret credentials that our app relies on to connect to AWS?

In answer to this question, we'll take a look at something called **"environment variables"**, which provide a means of keeping secret things out of our code.

## Environment Variables

Our updated Gallery App is working fine, our boss is happy with the new S3 upload feature, and all is well with the world. 

All we need to do now is ask the CTO for the company AWS credentials, so we can change the CarrierWave initialiser to use them instead of our own personal credentials.

The CTO laughs in your face and walks off shaking his head.

Why? Because we NEVER add security information like passwords or AWS credentials to our source code. 

If we did, then anyone with access to the source code has the keys to the kingdom, and can thus cause all kinds of mischief, like stealing the company's AWS credentials and using the company credit card to fund their own startup! 

We need a way to enable lowly developers to be able to work with the code, without giving them the keys to the kingdom.

So how do we give our program the codes it needs without typing them in directly? One solution is to use "environment variables".    

- - -
##Shell variables vs Environment variables

Before we look at environment variables, let's remind ourselves about plain old shell variables. 

Just like we can create variables in a **pry/irb** session, we can also create variables in a regular shell session:

- Open irb
- Type `$ my_var=99`

To display the value of a variable, we use echo:

    $ echo $my_var
    99

Note that we prefix the variable name with a dollar symbol when we want to recall them.

Environment variables are very similar to regular variables, but we create them using "export":

    $ export MY_ENV_VAR=100
    $ echo $MY_ENV_VAR
    100

The difference between regular shell variables and environment variables is that whenever we launch a new program from the shell (e.g. our ruby program), it will inherit all the environment variables from the shell.

**We can see all the current environment variables by simply typing "env"** in the shell:

    $ env
    TERM_PROGRAM=Apple_Terminal
    SHELL=/bin/zsh
    USER=jon
    PATH=/Users/jon/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/libexec
    LANG=en_GB.UTF-8
    HOME=/Users/jon
    LOGNAME=jon
    MY_ENV_VAR=100

=> as we can see, there are lots of environment variables already. 

Any program we launch will have access to all of these and so our programs can find out all sorts of interesting things about the environment it is running in e.g.:
USER - the current user's name
HOME - the user's home folder
LANG - the language (and character encoding) the user is using
PATH - a list of places to look for programs we try and run

Note: we also have access to the "MY_ENV_VAR" variable we just created.

We can verify that these variables are accessible to our programs by launching one. For instance, pry is a program. 

So let's launch pry and take a look...

The ruby ENV object is a hash-like object that gives us access to the environment variables that ruby has inherited from the shell it was launched in.

    $ pry
    > ENV
    {"HOME"=>"/Users/jon",
     "LANG"=>"en_GB.UTF-8",
     "LOGNAME"=>"jon",
     "MY_ENV_VAR"=>"100",
     "PATH"=>
      "/Users/jon/.rbenv/versions/2.0.0-p247/bin:/usr/local/Cellar/rbenv/0.4.0/libexec:/Users/jon/.rbenv/shims:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/libexec",
     "SHELL"=>"/bin/zsh",
     "USER"=>"jon"}

    > ENV['MY_ENV_VAR']
    "100"

We can verify that the regular shell variable "my_env" was not passed to pry:

    > ENV['my_var']
    nil

We can see that it is possible to pass information to our ruby programs using environment variables. We now have a way to pass our secret credentials into our program at runtime, rather than hard-coding them into our source code.

- - -

More specifically, we can add our AWS credentials as environment variables. 

However, we don't want to manually create these environment variables every time we launch our app, and so we can add the "export" commands to our shell's config file. 

That way, every new shell we launch will have these credentials available as environment variables. 

## Add ENV variables to ~/.zshrc

To do so, we can add the following to .zshrc:

    export AWS_ACCESS_KEY_ID=AK9999999999999999999
    export AWS_SECRET_ACCESS_KEY=p9pkzBevqrererereiu99sdfsadf99999
    export WDI_S3_BUCKET=wdi4-mgp

We need to create a new terminal window or run **$ source .zshrc** in order for those new settings to take effect. Verify that they are available in terminal before continuing.

Now we can change our carrier wave initialiser to make use of these new ENV variables:

    CarrierWave.configure do |config|
      config.fog_credentials = {
        :provider  => 'AWS',  # required
        :aws_access_key_id  => ENV['AWS_ACCESS_KEY_ID'],  # required
        :aws_secret_access_key => ENV['AWS_SECRET_ACCESS_KEY'],  # required
        :region  => 'eu-west-1',  # optional, defaults to 'us-east-1'
      }
      config.fog_directory  = ENV['WDI_S3_BUCKET']  # required
      config.fog_public  = true  # optional, defaults to true
    end

Now we can restart the app, and the app still works as intended, but we no longer have secure info in our source code. The CTO will be happy.

## A note on Heroku and environment variables

We'll be using Heroku to deploy our apps. We can't edit our shell profile on Heroku, but they do provide us with a way to set environment variables, and the principle is the same.

IMPORTANT MESSAGE RE: AWS - if we forget to get rid of the content of the bucket, we actually will keep paying for it. Think of emptying it once you're done with it! 

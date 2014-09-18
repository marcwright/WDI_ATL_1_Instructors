# Deploying to Heroku - c 45mins

Heroku is a cloud platform service. Essentially it's virtual hosting for your apps. And it's free - as in beer.

To deploy a Rails app to Heroku, it's a fairly straightforward step-by-step process.

First you need to link your machine to your Heroku account - a similar process to what we did with Github.

1. add your ssh-key to your Heroku account.

```
  cat ~/.ssh/id_rsa.pub | pbcopy
```

2. [install Heroku toolbelt](https://toolbelt.heroku.com)

3. `heroku login`

4. Build and deploy your Rails app

```
  ######################################
  # ensure you're not in a git repo!!! #
  ######################################

  rails new deploy_test -d postgresql
  cd deploy_test

  rails g scaffold Customer name:string

  git init

  ## should be no need to run these two... but occasional barfs require it
  # RAILS_ENV=production bundle exec rake assets:precompile
  #  config.assets.initialize_on_precompile = false

  git add .
  git commit -m "initial commit"
  heroku create
  heroku addons:add heroku-postgresql

  git push heroku master

  heroku run rake db:migrate

  heroku open
```

https://devcenter.heroku.com/articles/rails-asset-pipeline


# projects on Heroku

  git@github.com:LukeRobertsonUK/ga_organiser_app.git

  git clone git@github.com:LukeRobertsonUK/ga_organiser_app.git project_deploy

  cd project_deploy

  heroku create

  git push heroku master


  config.assets.initialize_on_precompile = false

  heroku run rake assets:precompile


  git checkout -b deployment

  rake assets:precompile

  git add .

  git commit -m 'asset precompile'

  git push heroku deployment:master



  git checkout master

- edit a file, commit it

  git checkout deployment

  git merge master

  git push heroku deployment:master



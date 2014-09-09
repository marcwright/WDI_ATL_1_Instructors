## SimpleCov
- What is Code Coverage?
- https://github.com/colszowka/simplecov
- `gem 'simplecov', '~> 0.7.1'`
- Identify untested areas

```
require 'rspec/rails'
require 'rspec/autorun'
require 'capybara/rails'
require 'simplecov'
SimpleCov.start
```

## Deployment

- Sign up for Heroku
- Install Heroku Toolbelt
- gem 'rails_12factor'
- heroku create
- git push heroku master
- heroku run rake db:migrate
- heroku open
- https://devcenter.heroku.com/articles/renaming-apps
- heroku apps:rename newname
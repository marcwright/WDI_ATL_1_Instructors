##Project Repo Setup Notes

####Step 1
`rails new your_app_name -d postgresql -T`

####Step 2

```ruby
# Gemfile
group :development, :test do
  gem 'pry-rails'
  gem 'rspec-rails', '~> 2.14.0'
  gem 'shoulda-matchers'
  gem 'capybara'
  gem 'launchy'
  gem 'factory_girl_rails'
  gem 'ffaker'
end
```

####Step 3
`cd` into your app.
`git init`
`git add .`
`git commit -m "initial commit"`

####Step 4
1. Go to GitHub and create a new app. 
1. Copy the ssh key
1. `git remote add origin <ssh_url>`
1. Add collabs




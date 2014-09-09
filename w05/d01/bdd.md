## Learning Obj
- Explain what acceptance testing is, why it is used, and where it fits in the Agile workflow
- Explain the difference between acceptance testing and unit testing
- Explain what Capybara is and how it tests your app
- Write acceptance tests for a Rails app using Capybara with Rspec

### Testing
- So start coding right? NO!

##### BDD
- http://en.wikipedia.org/wiki/Behavior-driven_development

##### Unit vs Acceptance testing
- http://stackoverflow.com/questions/4904096/whats-the-difference-between-unit-functional-acceptance-and-integration-test

##### Capybara
- What is Capybara?
- Why?
- Outside-in-BDD?

### Setup

- rails new -d postgresql -T
- set up new Github Repo

```
group :development, :test do
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'capybara'
  gem 'launchy' #save and open page
end
```

- `rails generate rspec:install`
- follow `https://github.com/jnicklas/capybara` spec_helper
- https://gist.github.com/zhengjia/428105

### 1st feature - Home page

* Typically don't write unit tests for AR since its already tested
* Will make more sense when we get to more complex features later this week
* For now, just to get used to Capybara

### 2nd feature - Artists

- Tests for show and create (let vs let!, lazy evaluation)
- Implement a test for update
- Implement tests for songs

- Artist has a name, photo_url, genre
- Song has a title, year, artist_id

- Write the test
- Model
- Route
- Controller
- View

```

  resources :artists do
    resources :songs, except: [:index, :show], shallow: true do
      resources :purchases, only: [:create]
    end
  end

  resources :users do
    resources :songs, only: [:index]
  end

  get "/login", to: "session#new"
  post "/session", to: "session#create"
  delete "/session", to: "session#destroy"

  root "welcome#index"
  ```
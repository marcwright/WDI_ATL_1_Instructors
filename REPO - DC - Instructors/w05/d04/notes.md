# Framing

## Scrum

## Goals

- Differentaite between Acceptance vs Unit testing
- Explain what Factory Girl does and use it
- Follow a process for implementing a new feature
- Use `rake notes` to keep track of todos

# Purchase feature

## Wireframe it and write Acceptance test

- Create a new user
- Create a new artist & song
- Log in the user
- Visit the songs page
- Click the purchase button for a song
- Visit the list of users songs
- Expect the song you purchased to be on there

## Modeling

- Update ERD, Add purchase model
```
class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.references :song
      t.references :user
    end
  end
end
```

```
class Purchase < ActiveRecord::Base
  belongs_to :song
  belongs_to :user
end
```

- Update User associations
```
  has_many :purchases
  has_many :songs, through: :purchases
```

- Update Song associations
```
  has_many :purchases
  has_many :users, through: :purchases
```

- Add Price Column to Songs
```
class AddPriceToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :price, :decimal, default: 1.99
  end
end
```

- Add Balance Column to Users
```
class AddBalanceToUsers < ActiveRecord::Migration
  def change
    add_column :users, :balance, :decimal, default: 10.00
  end
end
```

## Add User Validations for balance

- Validation Test
` it { should validate_numericality_of(:balance).is_greater_than_or_equal_to(0) }`

- Validation
`validates :balance, numericality: { greater_than_or_equal_to: 0 }`

## Factory_girl?

- https://github.com/thoughtbot/factory_girl_rails

- Update Gemfile with factory girl and faker
```
  gem 'factory_girl_rails'
  gem 'ffaker'
```

- Put factories in `spec/factories`


- Artist Factory
```
FactoryGirl.define do
  factory :artist do
    name { Faker::Name.name }
    genre "Pop"
    photo_url "http://google.com"
  end
end
```

- Song Factory
```
FactoryGirl.define do
  factory :song do
    title { Faker::Lorem.words(3).join(" ") }
    year 2001
    price 1.99
    association :artist
  end
end
```

- User Factory
```
FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email } 
    name { Faker::Name.name }
    password "password"
    password_confirmation "password"
    balance 10.00
  end
end
```

- Refactor admin_can_manage_artists with factories
`let(:kesha) { FactoryGirl.create(:artist) }`

---

Break

---


## User Unit Test for purchase feature

```
describe "#purchase" do
    subject(:user) { FactoryGirl.create(:user, balance: original_balance) }
    
    let(:original_balance) { 4.00 }
    let(:tick_tok) { FactoryGirl.create(:song) }

    context "when affordable" do
      before { user.purchase(tick_tok) }

      it "adds the song to the users songs" do    
        expect(user.songs).to include(tick_tok)
      end

      it "debits the users balance" do
        expect(user.balance.to_f).to eq(original_balance - tick_tok.price)
      end
    end

    context "when not affordable" do
      before do 
        tick_tok.price = 6.00
        user.purchase(tick_tok)
      end

      it "doesn't add the song" do
        expect(user.songs).to_not include(tick_tok)
      end

      it "doesn't debit the user's balance" do
        expect(user.reload.balance.to_f).to eq(original_balance)
      end
    end
  end
  ```

- User Model

```
  def purchase(song)
    if update(balance: balance - song.price)
      # Note that the push will save too
      self.songs << song
    end
  end
```

---

BREAK

---

# UI

## Routes

```
  resources :artists do
    resources :songs, except: [:index, :show], shallow: true do
      resources :purchases, only: [:create]
    end
  end

 resources :users, except: [:index] do
    resources :songs, only: [:index]
  end
```

## Controller

```
class PurchasesController < ApplicationController
  def create
    @song = Song.find_by(id: params[:song_id])

    if current_user.purchase(@song)
      redirect_to user_songs_path(current_user)
    else
      redirect_to artist_path(@song.artist)
    end
  end
end
```

## Purchase authorization

```
<% if signed_in? %>
  <%= link_to "Purchase", song_purchases_path(song), method: :post %>
  <br/>
<% end %>
```

```
<%= form_tag('/posts', method: :post) do %>
  <div><%= submit_tag 'Save' %></div>
<% end %>
```

## View Purchased Songs

- Songs Controller

```
 def index
    @user = User.find(params[:user_id])
    @songs = @user.songs
  end
```

- Songs Index

```
<% @songs.each do |song| %>
  <%= song.title %>
<% end %>
```

---

BREAK

---


## Listen to full song

- Will implement and push
- Add spotify_url to the songs table
- Play Button
  - https://developer.spotify.com/technologies/widgets/spotify-play-button/
- Spotify Search API
  - https://developer.spotify.com/technologies/web-api/search/

```
class AddSpotifyUrlToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :spotify_url, :text
  end
end
```

`@song.spotify_url = get_spotify_url(@song)`

```
  def get_spotify_url(song)
    song_name = song.title.gsub(" ", "+")
    results = HTTParty.get("http://ws.spotify.com/search/1/track.json?q=#{song_name}")
    return results["tracks"][0]["href"]
  end
```

```
  <iframe src="https://embed.spotify.com/?uri=<%= song.spotify_url %>" width="300" height="380" frameborder="0" allowtransparency="true"></iframe>
```

## Deployment (Tomorrow)

- Sign up for Heroku
- Install Heroku Toolbelt
- gem 'rails_12factor'
- heroku create
- git push heroku master
- heroku run rake db:migrate
- heroku open
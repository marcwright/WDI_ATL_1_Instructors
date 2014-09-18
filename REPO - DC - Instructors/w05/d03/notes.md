## Scrum

## Git w/ Diagram

- git branch tuesday
- git branch
- git checkout tuesday
- git checkout master

- git fetch upstream
- git reset --hard upstream/master

- git branch wednesday
- git checkout wednesday

## Rspec Version
- gem uninstall rspec-core
- gem uninstall rspec-rails

## Model Validation

- Added validation tests for songs, artists, users

## Partials with local variables

##Authorization

- No tests for authentication :(
- Can go back and fill these in, not dragging you into it right now

- Authenticate vs Authorize

UsersController:

`before_action :require_current_user, except: [:new, :create]`

```
  def require_current_user
    if !current_user?(@user)
      redirect_to root_path
    end 
  end
```

Delete the Users index

## Admin

- I will write the code for this and push it to Tunr
- is_admin? false by default

---

Break

---

## APIs

- What is JSON?
- What is HTTParty?

- https://github.com/jnunemaker/httparty

## Stock App

- stock quote api
- http://dev.markitondemand.com/
- http://dev.markitondemand.com/Api/Quote/json?symbol=AAPL

---

Break

---

## User can preview songs

- Look at iTunes Search API
- https://www.apple.com/itunes/affiliates/resources/documentation/itunes-store-web-service-search-api.html
- Try to figure out what the query we would want to string together is (just do this in the browser). See if you can get a preview URL.

gem 'httparty'

```
class AddPreviewUrlToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :preview_url, :text
  end
end
```

```
 def create
    @song = Song.new(song_params)
    @song.artist = @artist
    @song.preview_url = get_preview_url(@artist.name, @song.title)
    @song.save

    redirect_to artist_path(@artist)
  end
```

```
  def get_preview_url(artist, song)
    artist = artist.gsub(" ", "+")
    song = song.gsub(" ", "+")
    from_itunes = HTTParty.get("http://itunes.apple.com/search?term=#{artist}+#{song}&media=music&entity=musicTrack&limit=1")
    from_itunes_as_hash = JSON(from_itunes)
    return from_itunes_as_hash["results"][0]["previewUrl"]
  end
```

```
<% if song.preview_url %>
  <audio controls>
    <source src="<%= song.preview_url %>">
  </audio>
<% end %>
```

https://developer.mozilla.org/en-US/docs/Web/HTML/Element/audio

---

BREAK

---

## OMDBAPI App

- Build an app
  - As a user I want to search for a movie by title
  - I want to be able to click my favorite search result and see more details for that movie. It should display the movie, year, imdbrating, FULL plot and poster
  - Bonus: Add a feature to save movies to a list that you can add and remove from

https://medium.com/wdi-nyc-jan-2014/6ddb0793d281

## Band.io

####Prompt
You've been tasked with building a three-model concert management app that makes use of the tools you learned about today: 
  - mass assignment with strong params
  - form helpers
  - link helpers 
  - asset helpers
  - partials to keep your views DRY
  - `before_action` to keep your controllers DRY

The models and behavioral specs are below. 

####Models
A __Venue__ can have many events, as well as many bands (through events), and has the following attributes:

- name
- city
- state
- allows_explicit_lyrics

An __Event__ belongs to a venue __and__ a band, and has the following attributes:

- date
- time

A __Band__ has many events, and the following attributes:

- name
- genre
- explicit_lyrics (a boolean)

####Behavioral Specs 

- The root path should provide links to: 
  - a listing of all venues
  - a form to create a venue
  - a form to create a band (independent of venue)
  - a form for searching all events (across all venues) that occurred on a particular date

- A particular venue should be able to:
  - create an event, choosing from a list of all bands
    - __Note:__ if the venue doesn't allow explicit lyrics, only kid-friendly bands should be listed as options.

####Bonus

- Make it pretty
- Allow an event to have many bands, like a festival



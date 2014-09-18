# Heroku architecture

- I thought we should explore a little bit of how Heroku works. 
- We've deployed our apps to Heroku before, but we kind of did it by magic.
  - git push, we're done. 
- And we've talked about using Postgres, not SQLite... but not necessarily why. 
- Part of this is because we're interested in Heroku, but also because we're interested in learning things for our own application architecture. 

# Start from the front: how have we done things up until now? 
- Most of what we've done so far has just run on our own computers. 
  - Both our DB and web server. 
- And presumably we're OK with the idea that we could just rent an expensive computer somewhere else to run our apps. 
  - Or more than one. 
- But maybe there's a better way.
  - Don't forget that we need to define what is better. 

# Virtual machines
- What if we wrote a program that pretends to be a computer? 
- Could we run another operating system within it? 
  - Yes we can
  - Yes we should
    - Abstraction can be useful
    - Users don't care
    - Can be more available (load balancing, reliability)
    - Developer VMs
- But how does this interact with a web service? 
  - If nobody uses your app, things are easy. 
  - One machine for everything. One server: web/DB/file storage. 
  - One machine for each thing. One web server, one DB, one file store. 
  - But... what happens next? 
    - Not as simple as dividing the load 50%. 
      - Cookies/session data. 
      - Send to right database.
      - Which file store? 
    - What happens when we add ANOTHER server? 
    - We've got to design our apps so they can cope with this. 
      - Think in terms of services, not servers. 

# Rule one: no persisted state.
- Heroku has dynos, which are just virtual machines.
- Heroku doesn't promise to keep them running. 
- Heroku doesn't tell you where they are running. 
- Heroku doesn't let you at the local filesystem.
  - Because there is no local filesystem.
- So... don't store things on the hard drive. 
  - No files
  - No session data. 
- Your app can move at any time: think of servers as disposable
- Users might not talk to the same dyno for each request. 

# Rule two: keep things short
- App should be quick to start
- App should be quick to quit
- Because it can happen at any time. 

# Rule three: use background workers. 
- If something is going to take a long time, use a background worker. 
  - Image scaling
  - Retrieving stuff from an API
  - Uploading data
  - Deep logic (eg. chess)
- Rather than doing the work in the web request, queue a task for it and return immediately. 
- Something in the background takes a task, performs it, and updates the database. 
- Then future web requests can reflect that in their action. 
- Maybe poll via AJAX to say whether it's been done or not. 

# Service Oriented Architecture
- Think in terms of services, not servers. 
- Either because you're hiding details behind a load balancer, or because you're writing small apps that collaborate. 
- eg. a social site. 
  - One web server app that renders data in a human-readable form
  - One service that deals with messages
    - Does this user have any messages? 
    - Send a message to this user
    - Get message history
    - Get user history
  - One service that gets profile data
    - Get data for user
    - Get photos for user
    - Get blog posts for user 
    - Get wall for user
  - One service for search
    - Find users in London
    - Find users called Jane
    - etc
  - etc. 
- Now you're designing to an interface, not a server.
  - Easier to scale
  - Easier to swap out/rebuild
  - Easier to think about/check.
  - Less to go wrong. 
- Small pieces, loosely joined. 
- Maybe those services are composed of other services...

# Side benefits: a lot of infrastructure. 
- Rollbacks
- Logging
- Monitoring
- Blocks you can clip together. 

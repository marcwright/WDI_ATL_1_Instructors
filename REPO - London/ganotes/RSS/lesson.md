# RSS

- So one of the projects is an RSS reader. What is RSS? 
- Sometimes you hear it called a newsfeed. 
- RSS is a way for websites to indicate when they've been updated. 
  - And share that content. 
- It's just text. 

- History
  - IE4, Active Channels
  - RSS, 2 versions, at least
  - Atom

- Let's have a quick look at an RSS feed. 
  - http://feeds.bbci.co.uk/news/rss.xml
  - This is the BBC news feed. 
  - It's XML!
  - It's got this RSS element
    - Which contains a channel
    - Which also contains a bunch of items. 

- So... 
  - ... software can retrieve this file from the webserver periodically
  - ... and process it
  - ... and see what it's encountered before (guid)
  - ... and see what's new (guid, datestamp). 

- What can we do with that? 
  - Aggregate it for a user: pull in a whole bunch of stuff and let the user browse. 
    - Don't have to go back to a website
    - Don't have to remember the website
  - Syndicate it on your own website
    - Maybe you could build a 'Top news from around the world' site, that displays headlines from other media outlets. 
  - Take action based on notifications

- Some people read big websites that way. But that's crazy. 
  - Small blogs that update infrequently
  - Small funnies - cartoons, quotes, etc. 
  - Niche stuff only you care about.
    - http://www.theguardian.com/theguardian/series/correctionsandclarifications/rss
    - Friends' blogs
  - Personal alerts
    - http://ws.audioscrobbler.com/1.0/user/acreature/eventsysrecs.rss
    - Search results based on your criteria
      - eBay
      - Jobs
      - Gumtree
      - Kindle offers. 
  - Mash stuff together
    - Music combined with news. 
  - And it's all in one place. 
    - No need to check 100 places. Or even remember them. 
    - When you find something you like, you can add it to your news reader. 

- But it's a technology. 
  - So you can do what you like with it. 
  - And others can do what they like with it. 
  - What I want from a news reader is different to what other people want. 
  - But if you're building something that's some kind of stream, expose it as RSS. 

- Some sites
  - Feedbin
  - Ifttt



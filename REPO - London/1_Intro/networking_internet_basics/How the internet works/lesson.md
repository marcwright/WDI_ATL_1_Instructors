
Alex's lesson plan from WDI5 & 6


# Objective

- Students should understand the basic networking infrastructure of the internet
- Students should understand the request/response model
- Students should understand how HTTP works, including verbs
- Students should understand how browsers interpret responses
- Students should understand how web servers work


# Outline

"Today we're going to start at the top, and work our way down. And we're going to jump down a bit." 
Kind of the point of the lesson is that the internet is built out of lots of little blocks, that all work together. Easy to hard is not the same as straightforward to complicated. 

In a way, a lot of what we're going to be doing in the course is talking about individual blocks. So I'm hoping that by starting with this material you're going to be able to understand how the blocks fit together. 

Another key part of the internet is how much of it runs on text. It's all just text. This makes things easier too. 

1. Show a web browser on the screen, open BBC News. 
2. Wave a network cable around. "How do we get a web page over this?"

## Question: "Where did this web page come from?"

- Servers and clients
- Programs serving files
  - Which are really just programs returning data

## Question: "How did we know which server to talk to?"

- Names to IPs, using DNS
- Like looking up a phone number. (And once you've looked it up once, you don't have to look it up again for a while.)
- What is an IP? 
  - IPv4
  - IPv6
  - Internal and external IPs, and the differences thereof.


## Question: "How did the server send the page to the client?" 

- Request/response

- What's the server doing? 
  - We don't care
  - Could be serving static files
  - Could be pulling something out of the database
  - Could be calculating something and making it up as you go along
    - Like those ruby snippets you did that return strings. You could return a string that's an HTML document...
  - You might not even be talking to a web server at all! (Caches)

- HTTP
  - Request, with headers
  - Response, with headers
  - Response codes
  - Different verbs
- HTTPS

## Question: "How did the browser show it to the user?" 

- What's the web browser doing? 
  - It got back a bunch of text, but we're not just seeing the text. 
  - Parsing HTML into the DOM, and displaying it
  - Pulling down other resources

## Question: What happens when this stuff isn't true?

- Other internet protocols
  - Port numbers
  - SPDY
  - Web sockets


## Where did all this come from? 
- RFCs
  - What they are
  - Where to find them
  - MUST and SHOULD
  - Not the last word. 

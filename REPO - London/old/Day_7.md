# SQL homework review | 9:00 - 9:45
- Send me your answers - queries and results
- Go through SQL queries
- HW Code Review - Review the solution to the GA Stock Exchange Lab.


# Blocks revisited - yield & inject | 9:45 - 10:15
  - We were passing blocks to our enumerable objects; but blocks _are_ objects too
    - The code:
      my_array.each { |e| puts e }

    - Means that *somewhere* there's a "def each" method... how would it look?



  - Our own block:
  def gimme_a_block
    puts "where's the block?"
    #yield
  end
  gimme_a_block { puts "here I am" }

  - ensuring a block is given:
  def hiya
    if block_given?
      yield
    else
      puts "no block given :-("
    end
  end
  hiya { puts "hiya" }

  - Block parameters:
  def talk_to_fred
    yield "fred"
  end
  talk_to_fred { |i| puts "hiya, #{i}" }

  - This is what powers enumerable - each element is yielded to the block, and different enumerable methods do different things with the result
    %w(Fred Wilma Barney).each { |name| print name, " " }


  - inject / reduce
    - I skipped over this one in enumerable... but

    x = 0
    (5..10).each do |i|
      x += i
    end
    x => 45

    - is the same as:

    (5..10).reduce(0) do |sum, value|
      sum + value
    end
    => 45

    - is the same as:

    (5..10).reduce(:+)
    => 45

    - This is a very common Ruby idiom
    %w(the quick brown fox).map(&:reverse)


  - object.send(:method)



# Networking | 10:15 - 11:15
- How do the web pages that we write travel down this bit of wire?

- Networking is, by definition, connections between computers
  *Internetworking* is connections between networks.

- OSI model (Open Systems Interconnection) is an abstract model of communication in network, which lets us visualise how traffic (web pages, for instance) goes down the cables to appear on our screens
  - http://upload.wikimedia.org/wikipedia/commons/2/2b/Osi-model.png
  - http://farm9.staticflickr.com/8530/8552060067_bbc5120178_o.gif

- TCP/IP is a suite of protocols that controls the addressing between layer 3&4 - almost a front-end/back-end line

- IP addresses are allocated (typically dynamically) to identify machines on a network.
  They are comprised of four octets (8-bit numbers), which gives just over 4.2Bn addresses (though c.2Bn are reserved for other uses).
  (I had a copy of this in 1996: http://www.amazon.com/Internet-Yellow-Pages-Harley-Hahns/dp/0078820987, but I don't think it would be practical now :-)
  Initially this was considered to be a lot... now, with the amount of internet-connected devices needed... not so much.

- When machines and websites are identified by IP addresses, it's hard to remember where to find stuff... 173.194.34.115? 178.236.6.251? 194.66.5.2?
  DNS maps ip addresses to easily readable names:
  - www.google.co.uk, www.amazon.co.uk, www.antarctica.ac.uk

- So the Internet we know is built of all these components working together

- WWW pages are accessed by a protocol (HTTP), which is one Presentation of Transport across a Network of Physical cables (hrmm... WIFI counts as "physical" too)

- HTTP has methods (verbs) - just like our code has methods, and four of them map to our CRUD operations.
  - POST   : Providing a block of data, such as the result of submitting a form, to a data-handling process. Create.
  - GET    : retrieve whatever information is identified by the Request-URI. Read.
  - PUT    : Similar to a POST, but the definition implies this should be used as equivalent to... Update.
  - DELETE : speaks for itself. Delete.

- URI
    http://www.example.org/hello/world/foo.html?foo=bar&baz=bat#footer
    \___/  \_____________/ \__________________/ \_____________/ \____/
  protocol host/domain name        path           querystring    hash/fragment

# Break | 11:15 - 11:30

# HTML | 11:30 - 12:30
http://www.teaching-materials.org/htmlcss-1day/lesson1/slides.html#slide1

  - prior to 1990, docs on the internet looked like this:
    http://tools.ietf.org/rfc/rfc1084.txt

  - Dry, reliant on formatting consistancy for layout, stand-alone

  - To add context to the doucuments, [HTML](http://tools.ietf.org/html/rfc2616) was developed to result in this:
    http://tools.ietf.org/html/rfc1084

  - This enabled documents to be linked to each other, forming a "web" of relationships, which was coined:
    "The World Wide Web"

  - Subsequent extensions and enhancements to HTML, which have given more functionality and flexability in use have resulted in the current version HTML5

# Lunch

# HTML cont. | 13:30 - 14:30

# CSS | 14:30 - 15:30

# Break | 15:30 - 15:45

# Box Model | 15:45 - 17:00

# Homework
- PSD to HTML/CSS



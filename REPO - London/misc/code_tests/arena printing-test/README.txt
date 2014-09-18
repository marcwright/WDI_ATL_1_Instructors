We are designing a new process in our warehouse where we will need to print our greetings cards on the production line.

Our website is hosted offsite and so we need to come up with a way of downloading the orders for printing.

We have settled on creating a hosted API that will be consumed by a computer running a dedicated piece of software in the warehouse.

printing-server.rb contains the (very tiny) sinatra api service. For the actual version it would have access to the database for this
should work fine for the moment with fake data.

The computer in the warehouse is connected to a printer that is monitoring a watch folder. The printer is expecting to find XML files
to print. We don't actually have a spec for what the XML files should look like... but we're not too fussed. We imagine that it's
very similar to the structure of the JSON.

We need a small daemon in Ruby that periodically checks for orders that should be downloaded and then goes through and
grabs each order that is needed and puts a XML file in the watch folder.

Deliverables
============

It would be good to see a basic implementation of the daemon. However, for concepts that would take an unresonable amount of time to 
code up, please just write some comments down so we can see how you think. 

Please feel free to change anything in the server code and send the whole lot back.

Because these warehouses just tend to have typical domestic ADSL connections, they are very prone to internet problems. Something we're
particulary looking for is your approach to failure. How are errors dealt with? Can you think of a more efficient way to download the orders
considering the internet might be intermittent?

We're not asking you to code the entire project, this should take you an hour or two at the most. We're keen to see your approach to the work as much as we want to see your code.
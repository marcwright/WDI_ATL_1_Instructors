# Intro to Internet

**Learning Objectives**

- What is IP, what problems does it solve?
- What is TCP, what problems does it solve?
- What are networking layers?

## IP (Meet Ivan Pakkitz)

**Internet Protocol**
Ivan is a postal worker who can travel at the speed of light. He's happy to relay thousands of messages per second between you and a friend. However, he can only transport *one message at a time, and it has to fit on an index card*.
Unfortunately Ivan is incredibly inattentive, so there are a few *minor* limitations in his service:

- **Reliability**: He cannot guarantee that *every* message will be delivered successfully.- **Order**: He cannot guarantee delivered messages will arrive in the same order that they were sent.
- **Integrity**: He cannot guarantee that all messages will arrive in their entirety.
- **Recipient**: He cannot guarantee that messages will always be delivered to the correct recipient.

### Vocab

* **Packet**: a discrete chunk of data transferred over an IP-based protocol.
* **Header**: meta data to address and define the packet content.
* **Body**: the data payload of the packet.

## TCP

**Transmission Control Protocol**

- Builds upon the foundation of IP, but…
- Adds a transaction port at each end.
- Guarentees that messages are reliably sent whole, in the right order, and to the right person, but at the cost of speed.
- Great for plain text messages like web content, e-mails, and IMs.

*** Play the TCP/IP game!*

## HTTP

**Hypertext Transfer Protocol**

- Leverages TCP for sending text and file content with integrity.
- Defines a new format for addressing higher-level applications.

## UDP

**User Datagram Protocol**

- Favors speed over integrity…
- Uses ports, but eliminates TCP's integrity checks.
- Great for streaming videos and game data feeds where bulk speed is more important than occassional packet loss.

## Networks

- **Router**: Central node encapsulating network links.
- **LAN**: Local area network.
- **WAN**: Wide area network.
- **IPv4**: 2^32 (~4 billion addresses)
- **IPv6**: 2^128

### Networking Layers

There are four major layers of abstraction for networked applications:

* **Link layer**: gets computer to local connection point over LAN.
* **Internet layer**: connects computers globally over a WAN.
* **Transport layer**: assigns a listening port on either end of a transaction to send/recieve messages.
* **Application layer**: handles application-specific routing and behavior.
 
### Ports

- Allocated socket for sending and receiving data on behalf of a single application.
- Port 22: remote shells.
- Port 80: web servers.
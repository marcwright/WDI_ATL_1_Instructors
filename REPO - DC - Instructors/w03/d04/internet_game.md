# The TCP/IP Game

*It's like the telephone game, but more nerdy!*

Each player is a network link in our Wide Area Network (WAN).  Unfortunately, we've got some unreliable networks out there! Each player is given:

 - A reciepient player's name to transmit a message to.
 - A **Maximum Transmission Unit (MTU)**.
 - A rule to follow.

Each player selects an arbitrary message of 5-10 words to transmit. When transmitting any message, each player must segment their message into packets with word counts at or below their MTU. Players transmit their message across the network in the general direction of their reciepient.

---

## Round 1 (IP)

**Each player takes the following action when recieving incoming packets:**

### Segment

* Player segments an incoming packet (if necessary), and then passes each packet along to another link.

### Fragment

* Player strikes out any message words that exceed their MTU, then passes the packet along to another link.

### Drop

* Player drops the packet on the floor if it exceeds their MTU, otherwise passes it along to another link.

---

## Round 2 (TCP)

**Players take responsibility for a packet until they recieve a handshake from another player.**

Each player takes the following action when recieving incoming packets:

### Segment

* Player shakes hands *while accepting a new packet*, then segments it if necessary and passes each segment along to other links.

### Fragment

* Player shakes hands *while accepting a new packet*. If the packet length exceeds their MTU, they pass it back to the sender. Otherwise, they pass the packet along to other links.

### Drop

* Player only shakes hands *for packets that fit within their MTU*. Accepted packets are passed along to other links. Rejections leave the sender hanging until they give up and try another link.

# Error correction 

- Errors happen
- Things go wrong
- What kind of things can go wrong? 
  - Thunderstorms
  - Typos
  - People misreading stuff
  - Diggers
  - Congestion
  - Corruption
  - Physics
    - Diagram of analogue/digital. 
  - Bad handwriting
  - Fax machines - http://rawfoodsos.files.wordpress.com/2011/09/hawaii_fish_bread.png

- So what can we do about it? How do we deal with it? 

- Parity
  - Check digit
  - Rather than using 8 bits to store data, we can use 7 and a check digit. 
  - Even parity: must have an even number of 1s. 
  - Examples: 0000000, 1010001, 1101001

- Raid 
  - Redundant array of inexpensive disks 
  - Raid 0: striping
  - Raid 1: mirroring
  - Raid 5: distributed with parity.

- Bar codes
  - Bar codes have a check digit.
  - http://www.dynamicimagingsolutions.com/userfiles/checkdigit.jpg

- Two generals problem
  - Diagram 

- TCP 
  - Error correction. 
  - Ordered. 
  - Each packet contains a sequence number. The receiver sends back an acknowledgement of how far it's received. 
  - No acknowledgement? Re-sent data. 
  - Checksums again to make sure the data was correct. 


- Bonus: Luhn algorithm
  - Take a number. Double the value of every second digit from the end. If it's two digits, add the two together. 
  - Add all of the digits. Multiply by 9. The last digit is the check digit. 

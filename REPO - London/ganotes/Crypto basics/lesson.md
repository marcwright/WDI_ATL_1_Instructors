# A history of Cryptography

- We use cryptography to keep things secret. Why do we want secrets? 
  - Hide things from an adversary.

- How can we hide stuff? 
  - Hope that our message doesn't get intercepted
  - Hide our message 
  - Make a message that doesn't look like a message.
  - Write the message in a form you can't read. 
  - Some combination of the above. 

- Carve a message into a wooden tablet, write another message on the wax on top.
- Tattoo it on a slave's head, wait for the hair to grow out. 

- Ciphers. 
  - Caesar cipher: move every letter on 3 letters. 
  - Use weird symbols.
  - Viginere cipher: pick a code word, use that as the key over and over and over. 

- How do you break them? 
  - Caesar ciphers: you can just permute it all and look for common words. 
  - Symbols and caesar ciphers: ETAOIN SHRDLU. Frequency analysis. 
  - Works for viginere cipher too, if you have enough body text.
    - It's essentially a whole bunch of caesar ciphers run together. 
  - Guesswork to recover the key. 
    - The Germanic tendency for regularity caused problems in WWII; if you know your enemy broadcasts a weather report at 6AM, and it always starts "Wetter am sechs uhr", then that's some plaintext to try at first. 

- One time pads
  - Still used today
  - Unbreakable! 
  - Numbers stations
    - The Lincolnshire Poacher: http://www.youtube.com/watch?v=QnXPqUU6fI0
    - Achtung: http://www.youtube.com/watch?v=EdnoAJ7KoFE
    - http://www.youtube.com/watch?v=eIDV-a6zF28
  - Unbreakable, in theory...
    - If you reuse a page, you're stuffed. 
    - If your pages are predictable, you're stuffed.
      - Because you use a daily paper or a book or something as your key
      - Because you're no good at generating random numbers. 
      - Because people are no good at randomness: typewriters. 
      - You don't have to be completely predictable; just reduce the search space.
        - Mention password restrictions here. 
    - If your pages get captured, you're stuffed. 


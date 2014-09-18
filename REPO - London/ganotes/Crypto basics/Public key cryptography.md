# Public Key Cryptography

- Yesterday we talked about some of the basics of encryption, and its history. 
- We talked about Caesar ciphers and Viginere cyphers. 
- These are called symmetric encryption algorithms, because you use the same key to encrypt and decrypt.
  - You need to know the secret codeword is 'CAT', and the recipient needs to know that too.
  - But how do you get keys to other people? 
  - What if you don't trust the messenger? 
  - What if you've never met? 

- These are asymmetric crypto algorithms, and they're used all over the web. 
- They're based on the idea that some things are easy to do, but hard to undo. 
  - Michael gave the example of baking a cake. It's easy to turn flour, water, eggs, and sugar into a cake. But it's hard to turn a cake into flour, water, eggs, and sugar. 
  - Open your calculators. 
  - What do you get if you multiply 839 * 499? (418661)
  - Okay. Now, can you give me two prime integers that multiply to give me 178723?

  - What's (2+7)*75 + ((6-1)* 8? (715)
  - Okay. Now... http://www.dilan4.com/maths/countdown.htm

- So how can we use this principle to keep us secure? 
  - Let's say I want to send a private message to Tim, but I've never met him. 
  - Tim publishes a public key to the world; something that everyone in the ENTIRE WORLD can read. 
  - I use Tim's public key to encrypt the message. 
  - But to decrypt it, you have to have the private key. You can't use the public key to decrypt.
  - This is how SSH works; when you gave Github or Heroku your public key, your idrsa.pub, when you try to log in it uses your private key for authentication. 

- But we can use this technique for other things too. 
  - Instead, let's say I want to prove that I wrote a message, and that it hasn't been tampered with. 
  - I can compute a *signature* for my message by encrypting it with my private key. 
  - Now, anyone can *decrypt* that message using my *public* key. And that's published on the internet, so anyone can confirm that the message hasn't been tampered with. 

- Key exchange. 
  - Combine your private key with Mark's public key. 
  - If Mark combines his private key with your public key, you get the same result! 
  - So you now have a shared secret without transferring anything between you, so an eavesdropper can't read your messages. 

- SSL works on a similar principle.

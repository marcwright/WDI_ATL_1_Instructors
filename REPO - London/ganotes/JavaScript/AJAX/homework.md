GAChat
=====

- GAChat is a group chat system. You've been given a chat server that runs in Sinatra. 
  - It's got two actions: a `GET /` that renders the page, and a `POST /chat` that saves a line of text. 
  - Our `POST` is smart enough to cope with AJAX: if you don't have AJAX working, it does an HTTP redirect back to the home page. But if you do have it working, then it returns JSON that contains all the lines of text since the last time you said something.

- *Your mission is*: 
  - Create a JavaScript file that submits the lines of text supplied to the server, via AJAX. 
  - It should then update the display with the new lines of text.
  - Don't forget: when you submit later lines of text, it should only add the new ones back...

  - Considerations: 
    - What happens if it hits an error? 
    - Should you be able to submit with no name? With no line? 
    - What would help the user experience? 
      - Highlight your name when you get mentioned? 
      - Update the chat display based on a timer instead
    - How could you extend it? 
      - Private messaging? 
      - Make the server store lines? 
  - Try to do as much as possible in JavaScript. My version runs fine with the server supplied - but if you want private messaging, you might have to change the server... 


# Exercise: convert previous calculator into something unobtrusive. 

- Move code to a separate file
- Look for events instead of onclick handlers
  - Use addEventListener on Elements, which takes an event to listen for and a function object.
    ```
    var el = document.getElementById('foo');
    el.addEventListener('click', function() { 
- Disable JS and look how it posts. 
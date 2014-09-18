## The DOM & Events

### Concepts
- Explain what the DOM is and how it is structured
- Differentiate between an element node and a text node

### Mechanics
- Select and target DOM elements using a query selector
- Change the attributes or content of a DOM element
- Add and remove elements from the DOM
- Attach an event listener to a DOM element
- Use a callback function in order to attach behavior to events.
- Use setTimeout to execute code after a specific delay
- Use setinterval & clearinterval to repeatedly execute code at specific intervals


---

### The DOM

- https://developer.mozilla.org/en-US/docs/DOM/DOM_Reference
- The Document Object Model (DOM) is a programming interface for HTML and XML documents. It provides a structured representation of the document (a tree) and it defines a way that the structure can be accessed from programs so that they can change the document structure, style and content. The DOM provides a representation of the document as a structured group of nodes and objects that have properties and methods. Essentially, it connects web pages to scripts or programming languages.
- Though often accessed using JavaScript, the DOM is not part of it and it can be used by other languages, though this is much less common.

- Read later:
- https://developer.mozilla.org/en-US/docs/DOM/DOM_Reference/Introduction


### Document

`document`
  - `document.head`
  - `document.body`

Each web page loaded in the browser has its own document object. The Document interface serves as an entry point to the web page's content 

`document.body`
  - .children
  - .childNodes
  - .firstChild
  - .lastChild
  - .nextSibling
  - .parentElement
  - .parentNode

Draw the DOM Tree on whiteboard

### Selecting DOM elements

- document.getElementById
- document.getElementsByTagName
- document.getElementsByClassName
- document.querySelector
- document.querySelectorAll

### Altering DOM Elements

- .textContent
- .innerHTML
- .setAttribute(name, value);
- .id
- .classList.toggle (add, remove, contains)
- .style

### Creating/Removing DOM Elements

- .createElement
- .appendChild
- .removeChild

### Fellowship

---

### Events
- https://developer.mozilla.org/en-US/docs/Web/API/Event

- .addEventListener
  - click
  - mouseover
- .preventDefault()

### Pixart
- http://subtlepatterns.com/

### Timers

### Walking

### ATM
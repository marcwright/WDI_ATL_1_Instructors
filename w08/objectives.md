# DOM Events & Rendering

## Concepts
- Explain what DOM event propagation is, and why clicking an element registers with all parents.
- Explain what an event's `.preventDefault` method does.
- Describe what Underscore's `.debounce` method does, and why we'd use it with redundantly triggered events.
- Explain the benefit of pre-rendered HTML strings rather than adding new DOM elements individually.
- Explain the difference between `.append` and `.html` when displaying newly rendered HTML content.

## Mechanics
- Use `evt.preventDefault()` to supress a default browser behavior.
- Use `_.debounce` to throttle the rate of redundant event triggers.
- Generate a list of new HTML elements as a string, and insert it into the DOM with a single update.
- Append new HTML content at the bottom of existing content.
- Replace existing content with newly created HTML content.

# Async Programs

## Concepts
- Explain the difference between synchronous and asynchronous program execution.
- Explain why synchronous program execution is not conducive to the front-end.
- Describe what a Callback is.
- Describe what an Event is.
- Describe what a Promise is.

## Mechanics
- Setup a timer with a callback.
- Setup an event listener with a callback.
- Setup and resolve a deferred (promise) object.

# Ajax

## Concepts
- Explain what Ajax is.
- Explain the difference between an Ajax request and a browser URL-bar request.
- Explain what Cross-Origin Resource Sharing (CORS) is, and why it exists.
- Explain what `$.ajax` is, and how it relates to methods such as `$.get` and `$.getJSON`.

## Mechanics
- Use jQuery `$.ajax` to make an asynchronous data request.
- Use higher-level jQuery Ajax methods including `.get` and/or `.getJSON`.
- Provide a callback, or chain a `.then` to capture the response when it's ready.
- Render new HTML content using data loaded from an Ajax request.
- Customize ajax requests with various HTTP methods ("patch", "delete", etc).

# Ajax + Rails

## Concepts
- Explain what "searialization" refers in regards to form submission.

## Mechanics
- Extend jQuery with a `serializeObject` method, and use it to searialize form data.
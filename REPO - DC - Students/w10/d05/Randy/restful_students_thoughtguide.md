## RESTful Students ThoughtGuide

Things to note in building RESTful Students

####Passing collections to an instance of a list view.

An instance of a view doesn't have a collection by default. Therefore, when we instantiate a view, we have to *pass* it a collection.

```javascript
var listView = new StudentListView({ collection: whateverYouCalledYourCollectionInstance });
```

#### The need to fetch.

 The Predators assignment had pre-populated data built into its collection, which meant we could access the collection's models immediately. In RESTful students, our data resides on the server, so our newly instantated collection is nothing but an empty vessel. To breathe data into the collection, we call `collectionInstance.fetch()`, which will populate the collection with data from the server. Now read on...


#### Asychronous execution on fetch().

When we tell our collection to `.fetch()`, the browser fires off an AJAX call to the server, but before it gets back with the necessary data, the browser moves on and tells other code to execute. Trouble is, the continued execution of the program assumes the collection has data, which it doesn't. We handle this by executing code only *after* data has loaded, via a promise, i.e. by using `.then()`

Something extra to keep in mind: almost every part of our program relies on the collection having data, right? Can you think of a way to structure our client-side application so that nothing else fires off until the collection has successfully fetched its data?

#### The fact that `.render()` doesn't actually append anything to the page.

It seems strange that a method called `.render()` doesn't actually 'render' anything visible to the page in and of itself, but it's true. And here's why. Imagine you want to use different instances of a particular view on different pages or in two different places on the *same* page. In that case, having your render function append something to a particular DOM element limits its usage and extensibility. 

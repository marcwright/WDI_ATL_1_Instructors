

# Lesson 

- AJAX! What is AJAX? 
  - Asynchronous JavaScript And XML
  - We use it to do stuff in the background
  - Such as making our pages feel more responsive by not requiring a full page load. 
  - Or pulling in content after our page has loaded. 
- What's JavaScript? 
- What's XML? 
- What's 'Asynchronous'? 
  - JavaScript is defined as 'single-threaded', which means 'can only do one thing at a time'. 
  - And network access is slow!
- In reality, we don't use XML all that often any more. Often we use JSON, but nothing says it has to be. 

- An AJAX request consists of a few things. 
  - We need a URL to call, and maybe some data to go with it. 
  - We need a callback function: something that runs when we get our data back. 
  - Generally, we need two: one that runs on success, and one that runs on failure. 

 

### What's wrong with that? 
- Nothing! 
- It works fine! 
- But... what if the user loads a page, and then walks away to get a coffee? 
  - When they come back, it'll be out of date. And not obviously out of date. 
- We could make it autorefresh with pure HTML. 

  ```
  <meta http-equiv="refresh" content="1">
  ```

  - But this is kinda ugly. If the web server is slow, then they could come back to an error page. 
  - And what if the user's trying to do something, like type into a text box and we refresh it out from under them? 
- So maybe we could just make it update via JavaScript. 
  - But... remember when we said that JavaScript is single-threaded? 
  - And we saw it lock up the browser, and the page? 
  - Network access is SLOOOOOOW. We'd have a lot of pauses. 
  - And means your other code can't run. 

### AJAX! 
- So we can make it update via JavaScript in the background.
- It's just a web request! 
  - But instead of it originating from the web browser, it's originating from our code. 
  - The browser still makes the request, but it's driven by our JS - not by clicking links or submitting a form. 
- A little like me getting coffee. I could go out and get coffee...
  - But then you're all stuck here, waiting for me to return. 
  - Empty space.
  - And if I have to go grab something from the table outside...
  - Still empty space. The same empty space. 
- But what if I ask Imran to get me coffee? 
  - I can keep on teaching. I just don't have my coffee yet. 
  - I can do other stuff, simpler stuff, until I'm caffeinated. 
  - And if I'd asked Imran to grab something from the table outside, then I can tell you a different thing. 
    - He'll be back in a moment, so you should definitely wait. 
    - He's gone a bit longer, come back in 10 minutes. 

### So how do we do it? 
  - Browsers give you a think called the XMLHttpRequest object. Mostly... (IE)
  - We need an endpoint we can call. 
  - And we should request JSON data back. 
  - Now we've got it back, we need to do something with it. 
  - And we need to do something different if it fails. 
- And we need something that runs it. 
  - Hook it into the form button.

- How do we do this in jQuery? 
  - Include jQuery on the page. 
  - jQuery gives us a handy .ajax() method. 
    - It takes a bunch of parameters: 
      - url
      - complete - always runs
      - error - a function that runs on error
      - success - a function that runs on success
      - dataType - the type of the returned data that we're expecting. 
      - data - some information to send to the server. 
      - type - the HTTP method to use. 
  

  - We can also do this differently, using function chaining. 
    - done(), fail(), always().

- Let's make this better. 
  - Progress indicator.
  - Error messaging
  - Highlight elements when we load them in. 

- What else can we do with AJAX? 
  - We can check for users posting new content, like Twitter showing '3 new tweets' at the top if you leave a page open. 
  - We can do *partial rendering*, where we render part of the page on the server and send the new content to the browser. 
    - Could do this for pagination. 
    - Could do this for switching between tabs. 
    - Can reduce server load times, because we don't have to generate the entire page all at once. 
  - We can send data back to the server.

- What's the point? 
  - Smaller web requests
  - Makes pages feel more 'alive'
  - Lets us update pages without forcing the user to hit refresh


### Let's create an app

We're going to create an app that replicate a rest controller but every request<>response will be in ajax.

From the starting point sent by Gerry, we're going to add all the functionnalities to create a REST resource.

When you open the app and go to localhost:3000, you can see an empty table and a form , this will be updated later , the form will only be visible when you create a post or edit an existing one (new / edit) and the table will be displayed as the index method.

First let's split this template inside 2 "views". By default the table with the list of posts will appear, while the form will be hidden, so let's add `style="display: none;"` to the div #new_post

Now we only see the list we the page is loaded. Great! We need to trigger events on the two links in the sidebar to show either the list or the form.

Let's declare a javascript object in app/assets/javascripts/script.js

```
RailsAjax = {}
```

By convention, we will create a method initialize in this object, and the initialize method will be the only we call , then all the actions will happen internally inside the object.

```
RailsAjax.initialize = function(){
  
}
```
And call this method inside a `$(document).ready()` block

```

$(function(){
  RailsAjax.initialize()
})
```

Inside this method, we can now trigger events for the event click on the two links in the sidebar. 
```
$("a#new_post_link, a#all_posts_link").on("click", function(e){
  e.preventDefault()
  show_page = $(this).attr("id").replace("_link", "")
  RailsAjax.togglePages("#"+show_page)
});
```

`e.preventDefault()` stops the action of the event's target, in our case, it will stop the link action, means it will not reload the page.

The two divs that have to be shown or hidden have an id corresponding to the link related in the sidebar without a trailing `_link`:

* `new_post` will be shown by clicking on `new_post_link`
* `all_posts` will be shown by clicking on `all_posts_link`

we recreate the div id by removing `_link` from the id of the clicked link. then we send this string to the method togglePages.

```
//switch between list and form
RailsAjax.togglePages = function (id1){
  // this function needs to show one div and hide the other one
}
```

We will use a ternary operator to determine the other id , depending on which one has been passed as an argument to the `togglepages` method

Then we use the jquery method slideUp to hide one div, and `slideUp` and `slideDown` can take a function in argument that will be executed when the animation is completed, so in the callback we show the other div (the one passed as an argument) using slideDown

```
//switch between list and form
RailsAjax.togglePages = function (id1){
  id2 = (id1 == "#new_post" ? "#all_posts" : "#new_post")
  $(id2).slideUp(function(){ $(id1).slideDown() })
}

```

Now we show different part of the same page as if they were different pages, and without reloading the whole page !


## Submitting Data to the server (create action)

The form already exists, we need a method that will be executed when the form is submitted:

```
// the argument e stands for the event obkec 
RailsAjax.postForm  = function(e){

}
```
And we need to declare an event to call this method, in the document.ready method (where we call initialize)

```
$("#post_form").submit(RailsAjax.postForm) 

```

now this function needs to map the differents inputs of the form and send them as a hash to the server, like:

```
{
  post:{
    title: "value",
    description: "value"
    etc...
  }
}
```


So it's easy to declare and array containing the fields names: 

```
var fields = ["title", "description", "author", "twitter", "published_at"]

```

but there's a lot of chances that we will need to re-use this array so we should make it a property of the object RailsAjax

```
RailsAjax.fields = ["title", "description", "author", "twitter", "published_at"]

```


Now let's create the hash pulling all the fields values:

```
RailsAjax.postForm  = function(e){
  data = {}
  $.each(RailsAjax.fields, function(i, field){
    data[field] = $("#"+ field).val()
  });
}

```

We have to send this hash to the server using `$.ajax` :

```
$.ajax({
  url: "/posts",
  type: "POST",
  data: data,
  dataType: "json"
})
```


But this app is meant to do a lot of ajax requests, and we definitely dont want to copy the ajax method call everytime we need to do some ajax request, so let's move this to a separate method:

```
RailsAjax.request = function(url, method, data){
  return $.ajax({
    url: url,
    type: method,
    data: data,
    dataType: "json"
  })
}

```

With this method, in one line we can do any ajax request and get back a jquery object containing the data we need, or we can chain callbacks on the object returned, it is DRY, it is cool !

Let's update our method `postForm` to use the `RailsAjax.request()` method

```
RailsAjax.postForm  = function(e){
  e.preventDefault()
  data = {}
  $.each(RailsAjax.fields, function(i, field){
    data[field] = $("#"+ field).val()
  })
  RailsAjax.request("/posts", "POST", {post: data })
  
}
```

This is doing the ajax request, so if everything goes well on the server, a new post post has been saved in the database, without reloading the page !

We will see later how to reload the posts.


## Load the posts (index action)

We create posts, but we can't see the posts at the moment, so let's create an ajax request that will pull data from the server and inject it in our page, that will be an array of where every object corresponds to a post.

```
//request list of posts (index)
RailsAjax.getPosts = function(){
  $("#all_posts table tbody").html("")
  $.getJSON("/posts", function(data){
    $.each(data, function(i, item){
      row = $("<tr>"+
        "<td>" + item.title+"</td>"+
        "<td>" + item.description+"</td>"+
        "<td>" + item.author +"</td>"+
        "<td><a href='http://www.twitter.com/" + item.twitter +"'>@" + item.twitter +"</a></td>"+
        "<td>" + item.published_at+"</td>"+
        "<td><button data-id='" + item.id+"' class='btn edit_post'>Edit</button> <button data-id='" + item.id+"' class='btn btn-danger delete_post'>Delete</button></td>"+
        "</tr>");

      row.appendTo("#all_posts table tbody")
    })
  })
}
```

A bit of explanation,

To avoid populating the table with the posts several times, we remove the content of the table at the beginning of the function, this is what
```
$("#all_posts table tbody").html("")
```

is responsible for.

Then , because JSON is such a common format, Jquery have a method `$.getJSON`, this method assume you do a GET request, and the response is providing JSON, which is our situation at the moment. Then `$.getJSON` get a callback function as argument, this function will be executed when the response arrive and jquery will call this function with an argument corresponding to the data received, already converted to JSON, sweet !!!!

Inside this function (the one with the data argument, right after the line with `$.getJSON` ), we iterate over each object inside the array received as a response from the server, using the jquery each method:

```
$.each(data, function(i, item){

})
```

And we create a table row for each post, then we append it to the table body, right before the each method is closed:

```
row.appendTo("#all_posts table tbody")
```

To summarize it, we pull data from the server, then we create html with it under a format that suits our app, and inject the html into the page.


Hold on, it the `RailsAjax.postForm`, we just send the data from the form to the server, but now, we could call the function that we just created to refresh the page wth the new created post and then switch to show the table with `RailsAjax.togglePages("#all_posts")`, so in `RailsAjax.postForm`, add:

```
RailsAjax.getPosts()
RailsAjax.togglePages("#all_posts")
```


## Deleting a post (destroy)

now what if we want to destroy a post, well the function listing posts already include a button delete, we now need to link those buttons to a method that will send a request to the server to delete the realted post and remove the row representing the deleted row:

```
RailsAjax.deletePost = function(e){
  $this = $(this)
  var id = $this.data("id")

  var path = "/posts/"+ id.toString()
  RailsAjax.request(path, "DELETE").success(function(){
    $this.parent().parent().remove()
  })
}
```

We also need to update the delete method in the rails postsController, remove the respond_to block and replace it by 

```
render nothing: true, status: :no_content
```


We need to link this function to the delete buttons in the table:

```
$("#all_posts").on("click", ".delete_post", RailsAjax.deletePost)
```

## Edit/Update methods (edit/update actions)

The last thing is to be able to edit/update posts, we will use the same schema than a rails a scaffold, means we will populate the form for a new post with the data for the post we want to edit.

To do this , we will call a method `RailsAjax.editPost` when there is a click on an edit post button in the table.

```
  $("#all_posts").on("click", ".edit_post", RailsAjax.editPost)
```

And the method `editPost`:

```
RailsAjax.editPost = function(e){
  id = $(this).data("id")
  path = "/posts/"+ id.toString()
  RailsAjax.request(path, "GET").success(function(data){
    $.each(RailsAjax.fields.concat(["id"]), function(i, field){
      $("input[name="+field+"]").val(data[field])
    })
    RailsAjax.togglePages("#new_post")
  })
}
```

in this function, we create the path to get the data with the attribute `data-id`, part of the clicked button, then we populate the form with the data received from the server, the difference is that we populate the form hidden field id, we will use it later to know if the user try to create a new post or update an existing one.

Now the form should be populated with the values corresponding to the post we're trying to edit.

If we submit, that will create a new post, not update the existing one , so we're not going to create a different method for the update , just tweak a bit the `RailsAjax.postForm` method.

```
RailsAjax.postForm  = function(e){
  e.preventDefault()
  id = $("form #id").val()
  if(id != ""){
    path = "/posts/"+id
    method = "PUT"
  }
  else{
    path = "/posts/"
    method = "POST"
  }
  data = {}
  $.each(RailsAjax.fields, function(i, field){
    data[field] = $("#"+ field).val()
  })
  RailsAjax.request(path, method, {post: data })
  RailsAjax.getPosts()
  RailsAjax.togglePages("#all_posts")
}
```

Based on the presence or not of the id , we create different paths and we request the server with different methods, then because we're already reloading data after the ajax request , this works for both create and update.

# Congrats, you created a resource managed in ajax !!!

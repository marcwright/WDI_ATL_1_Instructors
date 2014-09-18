RailsAjax = {}
RailsAjax.fields = ["title", "description", "author", "twitter", "published_at"]


RailsAjax.initialize = function(){
  //Navbar links
  $("a#new_post_link, a#all_posts_link").on("click", function(e){
    e.preventDefault()
    show_page = $(this).attr("id").replace("_link", "")
    RailsAjax.togglePages("#"+show_page)
  });
}
//Simplify ajax calls
RailsAjax.request = function(url, method, data){
  return $.ajax({
    url: url,
    type: method,
    data: data,
    dataType: "json"
  })
}

//switch between list and form
RailsAjax.togglePages = function (id1){
  id2 = (id1 == "#new_post" ? "#all_posts" : "#new_post")
  $(id2).slideUp(function(){ $(id1).slideDown() })
}

//request list of posts (index)
RailsAjax.getPosts = function(data){
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

RailsAjax.handleForm = function(data){
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

RailsAjax.editPost = function(e){
  $this = $(this)
  id = $this.data("id")
  path = "/posts/"+ id.toString()
  RailsAjax.request(path, "GET").success(function(data){
    $.each(RailsAjax.fields.concat(["id"]), function(i, field){
      $("input[name="+field+"]").val(data[field])
    })
    RailsAjax.togglePages("#new_post")
  })
}

RailsAjax.deletePost = function(e){
  $this = $(this)
  id = $this.data("id")

  path = "/posts/"+ id.toString()
  RailsAjax.request(path, "DELETE").success(function(){
    $this.parent().parent().remove()
  })
}

$(function(){
  
  RailsAjax.initialize()
  $("#post_form").submit(RailsAjax.postForm) 
  $("#all_posts").on("click", ".edit_post", RailsAjax.editPost)
  $("#all_posts").on("click", ".delete_post", RailsAjax.deletePost)

  RailsAjax.getPosts()
})
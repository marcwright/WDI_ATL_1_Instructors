$(function(){
  var fields = ["title", "description", "author", "twitter", "published_at"];

  togglePages = function(id1){
    id2 = (id1 == "#new_post") ? "#all_posts" : "#new_post";
    $(id2).slideUp(function(){
      $(id1).slideDown()
    })
  }

  $("#new_post_link, #all_posts_link").on("click", function(e){
    e.preventDefault();
    var show_page = $(this).attr("id").replace("_link", "")
    togglePages("#"+show_page);
  })

  getPosts = function(){
    $("#all_posts table tbody").empty();
    $.getJSON("/posts", function(data){
      $.each(data, function(i, item){
        var row = $("<tr>" +
          "<td>" + item.title+"</td>"+
          "<td>" + item.description+"</td>"+
          "<td>" + item.author +"</td>"+
          "<td><a href='http://www.twitter.com/" + item.twitter +"'>@" + item.twitter +"</a></td>"+
          "<td>" + item.published_at+"</td>"+
          "<td><button data-id='"+ item.id+"' class='btn btn-danger delete_post'>Delete</button></td>"+ 
          "</tr>"); 
        row.appendTo("#all_posts table tbody")
      })
    })
  }

  deletePost = function(){
    $this = $(this);
    id = $this.data("id");
    path = "/posts/"+id;
    $.ajax({
      url: path,
      type: "DELETE",
      dataType: "json",
      success: function(){
        getPosts();
      }
    })
  }

  $("#post_form").on("submit", function(e){
    e.preventDefault();
    data = {}
    $.each(fields, function(i, field){
      data[field] = $('input[name="'+field+'"]').val()
    })
    $.ajax({
      url: "/posts",
      type: "POST",
      data: {post: data},
      dataType: "json",
      success: function(){
        getPosts();
        togglePages("#all_posts");
      }
    })
  });

  getPosts()
  $("#all_posts").on("click", ".delete_post", deletePost);
})














# Advanced Finders - Joins & Include
  
Active Record provides a finder method called 'joins' for specifying JOIN clauses on the resulting SQL. There are multiple ways to use the joins method.


## Using a string SQL Fragment

You can just supply the raw SQL specifying the JOIN clause to joins:

```
  Client.joins('LEFT OUTER JOIN addresses ON addresses.client_id = clients.id')
```

This will result in the following SQL:

```
  SELECT clients.* FROM clients LEFT OUTER JOIN addresses ON addresses.client_id = clients.id
```

- note: This method only generates INNER JOIN joins.


## Using Array/Hash of Named Associations

But we said we'd prefer not to write SQL if we can help it; and instead, we want to let Rails do it for us.

ActiveRecord lets you use the names of the associations defined on the model as a shortcut for specifying JOIN clause for those associations when using the joins method.

Given an example structure of objects:

```
  class Category < ActiveRecord::Base
    has_many :posts
  end
          
  class Tag < ActiveRecord::Base
    belongs_to :post
  end

  class Post < ActiveRecord::Base
    belongs_to :category
    has_many :comments
    has_many :tags
  end
   
  class Comment < ActiveRecord::Base
    belongs_to :post
    has_one :guest
  end
   
  class Guest < ActiveRecord::Base
    belongs_to :comment
  end
```


## Joining a Single Association

```
  Category.joins(:posts)
```

This produces the SQL:

```
  SELECT categories.* FROM categories
    INNER JOIN posts ON posts.category_id = categories.id
```

Or, in English: "return a Category object for all categories with posts". Note that you will see duplicate categories if more than one post has the same category. If you want unique categories, you can use `Category.joins(:post).select("distinct(categories.id)")`.


## Joining Multiple Associations

```
  Post.joins(:category, :comments)
```

This produces the SQL:

```
  SELECT posts.* FROM posts
    INNER JOIN categories ON posts.category_id = categories.id
    INNER JOIN comments ON comments.post_id = posts.id
```

Or, in English: "return all posts that have a category and at least one comment". Note again that posts with multiple comments will show up multiple times.


## Joining Nested Associations (Single Level)

```
  Post.joins(comments: :guest)
```

This produces the SQL:

```
  SELECT posts.* FROM posts
    INNER JOIN comments ON comments.post_id = posts.id
    INNER JOIN guests ON guests.comment_id = comments.id
```

Or, in English: "return all posts that have a comment made by a guest."

  
## Joining Nested Associations (Multiple Level)

```
  Category.joins(posts: [{comments :guest}, :tags])
```

This produces the SQL:

```
  SELECT categories.* FROM categories
    INNER JOIN posts ON posts.category_id = categories.id
    INNER JOIN comments ON comments.post_id = posts.id
    INNER JOIN guests ON guests.comment_id = comments.id
    INNER JOIN tags ON tags.post_id = posts.id
```


## Specifying Conditions on the Joined Tables

You can specify conditions on the joined tables using the regular Array and String conditions. Hash conditions provides a special syntax for specifying conditions for the joined tables:

```
  time_range = (Time.now.midnight - 1.day)..Time.now.midnight
  Post.joins(:comments).where('comments.published_at' => time_range)
```

An alternative and cleaner syntax is to nest the hash conditions:

```
  time_range = (Time.now.midnight - 1.day)..Time.now.midnight
  Post.joins(:comments).where(comments: { published_at: time_range })
```

This will find all posts that have comments that were created yesterday, again using a BETWEEN SQL expression.

```
  SELECT "posts".* FROM "posts"
    INNER JOIN "comments" ON "comments"."post_id" = "posts"."id" 
    WHERE ("comments"."published_at" BETWEEN '2013-07-11 23:00:00.000000' AND '2013-07-12 23:00:00.000000')
```


## "includes" - Eager Loading Associations

Eager loading is the mechanism for loading the associated records of the objects returned by Model.find using as few queries as possible.


### N + 1 queries problem

Consider the following code, which finds 10 comments and prints their writer's name:

```
  comments = Comment.limit(10)
  comments.each do |comment|
    puts comment.guest.name
  end
```

This code looks fine at the first sight. But the problem lies within the total number of queries executed. The above code executes 1 ( to find 10 posts ) + 10 ( one per each commnet to load the guest ) = 11 queries in total.


### Solution to N + 1 queries problem

Active Record lets you specify in advance all the associations that are going to be loaded. This is possible by specifying the includes method of the Model.find call. With includes, Active Record ensures that all of the specified associations are loaded using the minimum possible number of queries.

Revisiting the above case, we could rewrite it to 'eager load' guests:

```
  comments = Comment.includes(:guest).limit(10)
  comments.each do |comment|
    puts comment.guest.name
  end
```

The above code will execute just 2 queries, as opposed to 11 queries in the previous case:

```
  SELECT "comments".* FROM "comments" LIMIT 10
  SELECT "guests".* FROM "guests" WHERE "guests"."comment_id" IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
```


## Eager Loading Multiple Associations

Active Record lets you eager load any number of associations with a single Model.find call by using an array, hash, or a nested hash of array/hash with the includes method.


### Array of Multiple Associations

This loads all the posts and the associated category and comments for each post.

```
  Post.includes(:category, :comments)
```


## Nested Associations Hash

This will find the category with id 1 and eager load all of the associated posts, the associated posts' tags and comments, and every comment's guest association.

```
  Category.includes(posts: [{comments: :guest}, :tags]).find(1)
```

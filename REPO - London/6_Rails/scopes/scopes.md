# Scopes
[i]: 1hour

A scope is a subset of a collection. Sounds complicated? It isn't really. Imagine this:

You have Users. Now, some of those Users are subscribed to your newsletter. You marked those who receive a newsletter by adding a field to the Users Database (user.subscribed_to_newsletter = true). Naturally, you sometimes want to get those Users who are subscribed to your newsletter.

You could do this with and ActiveRecord finder:

```
  User.where(subscribed_to_newsletter: true).each do |user|
    # do stuff
```

But now everywhere you want to work with the subscribers, you need to write that finder; and what happens if either the definition of what a subscribed User is changes, or if it's just much more complicated in the first place.

Such finders are not so DRY or re-useable.


## Scope practice

We're going to try out using scopes in the app we used for the "joins_etc" lesson.

To refresh our minds, the app tracks blog `Post` objects, each of which belongs to a `Category`, and can have many `Tag`s and many `Comments`. Each `Comment` is associated to a `Guest`.


## First scope

If we want limit the scope of posts we get back from an ActiveRecord query to just those which are published, we could write a scope which returns only those records which have a value in the `published_at` field:

```
  # post.rb
  scope :published, where('posts.published_at is not null')
```

And call it as a class method:

```
  # console
  Post.published
```

We can chain all/any other ActiveRecord query methods to the result of a scope:

```
  # console
  Post.published.joins(:comments).group('comments.post_id').having('count(commetns.post_id) > 15')
```

And we can do the same inside scopes, so we could return only those posts which have been commented on:

```
  # post.rb
  scope :commented, joins(:comments).group('comments.post_id').having('count(comments.post_id) > 0')
```


But because we can't possibly know what other joins will be performed on our scopes in future, we have to ensure that all field names are unambiguous in the SQL:

```
  # AVOID SCOPES WITH POTENTIALLY AMBIGUOUS COLUMN NAMES
  scope :published, where('published_at is not null') # the Comment model has a `published_at` column too, so this will break if it's ever joined to comments
```


## Digging into scopes

We can also chain our scopes together to re-use querying functionality:

```
  # console
  Post.published.commented
```

Additionally, we can use scopes inside scopes to DRY up further (hough it's more useful when you can think of a shorter name to give the combined scopes:

```
  # post.rb
  scope :published_and_commented, published.commented
```



And as well as being class-level methods, our scopes are available on associations:

```
  Category.first.posts.published
```


## Working with times

Remember: Dates and Times are going to be the bane of our lives...

If you're working with dates or times within scopes, due to how Rails evaluates scopes, you will need to use a lambda.

```
  # post.rb
  scope :in_the_last_week, lambda { where("published_at > ?", Time.zone.now.ago(1.week) ) }
```

**NOTE**: Without the lambda, the above `Time.zone.now` will only be called once in production environment, and Rails will remember and re-use the time as it was the first time it was run. As time goes by, you end up with the wrong records, as the Time drifts further into the past... generally without you noticing for some time.

```
  # erroneous syntax for example - **DO NOT WRITE SCOPES WITH DATES/TIMES IN LIKE THIS**
  scope :in_the_last_week, where("published_at > ?", Time.zone.now.ago(1.week) )
```


## Lambdas

When a lambda is used for a scope, you can pass it arguments to make your scopes even more flexible:

```
  # post.rb
  scope :one_week_before, lambda { |time| where(published_at: (time.ago(1.week)..time) }

  # console
  Post.one_week_before(Time.zone.now)
```

However, this is just duplicating the functionality that would be provided to you by a class method:

```
  # post.rb
  def self.one_week_before(time)
    where(published_at: (time.ago(1.week)..time)
  end
```

Either syntax is acceptable, but the class method is preferred for complicated (multi-line) conditions, or if you need to add any conditional logic.

Just ensure the method always returns and ActiveRecord Relation so that it can be chained.

```
  # console
  Category.first.posts.one_week_before(Time.zone.now) # both the scope and the class method are accessed the same way
```


# Default Scopes

You can set a "default_scope" for a class, to extend the functionality of the `.all` method:

```
  default_scope where("posts.published_at IS NOT NULL").order(:published_at).reverse_order
```

You can remove all scopes with `.unscoped` - particularly for when you need to remove/override a default_scope.




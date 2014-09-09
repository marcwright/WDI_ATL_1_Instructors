# Rails Helpers

Use the following documentation to DRY up your Tunr app.

## Path and URL helpers

Instead of using `<a>` tags, we can use use the `link_to` helper in Rails. Read more about it here:

* [ActionView Helpers](http://api.rubyonrails.org/classes/ActionView/Helpers/UrlHelper.html#method-i-link_to)

Also, instead of writing out all of our paths by hand, we can use path helpers to refer to our paths:

* [Generating Paths and URLs from Code](http://guides.rubyonrails.org/routing.html#generating-paths-and-urls-from-code)

You can view a list of all your routes by typing `rake routes` into your terminal.

You can learn more about rake routes and routing from this blog post that PJ (GA-NYC) wrote:

* [Understanding Rake Routes](http://instantiatedobject.blogspot.com/2013/10/understanding-and-using-rake-routes-or.html)

## Strong Params

To prevent mass-assignment, we use strong parameters when accepting data into our model:

* [Strong Params](http://edgeguides.rubyonrails.org/action_controller_overview.html#strong-parameters)

## Form Helpers

You can use form helpers to help DRY up your forms. In particular, focus on the `form_for` helper.

* [Form Helpers Guide](http://guides.rubyonrails.org/form_helpers.html)

* [Form Helper Docs](http://api.rubyonrails.org/classes/ActionView/Helpers/FormHelper.html)


## Partials

You can use partials to DRY up your views. Learn more about how they work here:

* [Rendering partials](http://guides.rubyonrails.org/layouts_and_rendering.html#using-partials)

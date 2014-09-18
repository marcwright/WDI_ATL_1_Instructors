# View Partials

View Partials are another way of streamlining your code by breaking it into manageable chunks

Simply call "render 'filename'" from your view (or specify the path in the filename)

Often used to render the content of looped blocks or shared content (like forms - create/edit use the same form)

```
  <%= render "menu" %>
  <%= render partial: "menu" %>
```

will render the file '_menu.html.erb' from the current view's path with all the current instance variables

```
  <%= render "application/menu" %>
```

will share the 'app/views/application/_menu.html.erb'

Partials have the same access to instance variables as views do, but need to be passed any local variables (like we have to with methods)

  - some people argue that partials *should not* use instance vars, since they can't guarentee where they're going to be included from, they won't 'know' what values have been set


## Putting partials into our Planets app

Partials can be passed local variables from the render command. The locals are given as a hash, so that you *can* pass multiple variables to the partial.

```
  # index.html.erb
  <table>
    <% @planets.each do |planet| %>
      <%= render partial: "planet", locals: {planet: planet} %>
    <% end %>
  </table>

  # _planet.html.erb
  <tr>
    <td>
      <%=planet.title%>
    </td>
  </tr>
```

But every partial automatically has a local variable with the same name as the partial (minus the underscore). You can pass an object in to this local variable via the `:object` option, which is more idiomatic than overwriting it in the locals hash:

```
  <% @planets.each do |planet| %>
    <%= render partial: "planet", object: planet %>
  <% end %>
```

Within the `_planet.html.erb` partial, the 'planet' variable will refer to same object as the block variable 'planet' from the parent view.


## Simpler collection rendering

The `render` command can also take a collection as an argument, and rather than needing to loop manually, iterating each of the objects in the collection is done inside the render.

To simplify our example, we can render the planet partial for each element with one line:

```
  <table>
    <%= render partial: "planet", collection: @planets %>
  </table>
```


## More Magic

Rails offers some more functionality through reflection on the objects being rendered.

To render a single instance of an object with a partial the same name as its class we can call `<%= render @planet %>`.

Rails will reflect on the `@planet` object's class, and look for a partial called `_planet.html.erb`.

This could be combined with the loop to produce:

```
  <table>
    <% @planets.each do |planet| %>
      <%= render planet %>
    <% end %>
  </table>
```

But there's *more* magic - and the reflection will work on collections of objects too, enabling us to reduce our original three line loop and heavily configured render to:

```
  <table>
    <%= render @planets %>
  </table>
```

The best magic of this is that if that were a collection of `@heavenly_bodies` with not just Planet instances, but Moon, Star and Asteroids too, Rails would render each respectively in the `_moon.html.erb`, `_star.html.erb`, and `_asteroid.html.erb` partials.


- http://guides.rubyonrails.org/v3.2.19/layouts_and_rendering.html

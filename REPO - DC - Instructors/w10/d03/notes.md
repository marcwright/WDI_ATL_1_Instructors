* What is a Model?
* What is a Collection?
* What is a View?
* When/Why should a view update?

- Create a backbone app backed by a Rails backend

- Build a Rails app that acts as a JSON API
- Draw what updates what when events fire
  - ListenTo (model) vs events (dom)
- Clean up views using a front end template
  - What are templates and why do we use them?

---

Why use back end vs localstorage?

## Set up the Back-End

Schema:
```
  t.string :name, null: false
  t.string :img_url
  t.integer :coins, default: 0
  t.timestamps
```

- AR Model & seeds

- Set up the routes & controller as REST API
  - Index, Create, Update, Destroy
- Demo in browser the return json

- Index View & Background

---

## Hooking up Backbone

- Include backbone and underscore in vendor, update application.js
- create single backbone model & view

http://upload.wikimedia.org/wikipedia/en/3/39/YoshiMarioParty9.png

- model.save (create and update)
- model.destroy

- create a view associated with the model
  - render

- destroy (diagram this!)

- ListenTo (model) vs events (dom)

---

## Collections

- Model Collection
- ListView

---

## FormView

```
collection.create({
      name: name,
      img_url: img_url
    });
```

---

## Get Coin

- model
- view
- animate
- sound

---

## Templating

- underscore templating
- what does this look like (on the back end?)
- move script tag to the bottom

---

Create a Reddit-like app for sharing links and upvoting them

### Inspiration:
- http://www.reddit.com/
- https://news.ycombinator.com/
- http://www.datatau.com/
- https://news.layervault.com/

Your app should take a URL as input and dynamically get the title (grab the HTML title of the URL).

Once a link is on the list, users should be able to upvote them. It should dynamically sort them from most to least upvotes.
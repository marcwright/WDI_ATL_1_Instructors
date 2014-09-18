# JEKYLL FOR SIMPLE BLOGGING
http://jekyllrb.com/docs/home/
"Blog like a hacker"

Sometimes when we make websites we can get away with a simple static site instead of Rails or Sinatra, e.g.:

- A blog
- A promotional site

**EASY $$ for us hackers!**

Static sites can be served very quickly and cheaply.
Jekyll lets us make static sites using some dynamic tools (that you will recognise from rails):

  - Layouts
  - Partials
  - Substitutions (a form of interpolation)
  
## Getting started
We can install Jekyll using a gem.

    gem install jekyll
    jekyll new myblog
    cd myblog
    subl .
    
We'll come back to this.

## Benefit of static vs dynamic

Rails is a tool for making dynamic sites:

- **Routes** programmatically associated with actions & views
- **Views** = html + substitutions (from db data + business logic)
- **Server-side scripting needed**
- **Response times slow** as pages built for each request

Once upon a time, we only had static sites:

- Routes followed **folder structure** of html pages
- Views = plain html
- No scripting needed
- Response times very fast as page already rendered

## Why is Jekyll so cool?
Jekyll = static site + dynamic patterns

- **No database:** Unlike WordPress and other content management systems (CMS), Jekyll doesn’t have a database. All posts and pages are converted to static HTML prior to publication. This is great for loading speed because no database calls are made when a page is loaded.
- **No CMS:** Simply write all of your content in Markdown, and Jekyll will run it through templates to generate your static website. GitHub can serve as a CMS if needed because you can edit content on it.
- **Fast:** Jekyll is fast because, being stripped down and without a database, you’re just serving up static pages. Less HTTP requests.
- **Minimal:** Your Jekyll website will include absolutely no functionality or features that you aren’t using.
- **Design control:** Spend less time wrestling with complex templates written by other people, and more time creating your own theme or customizing an uncomplicated base theme.
- **Security:** The vast majority of vulnerabilities that affect platforms like WordPress don’t exist because Jekyll has no CMS, database or Ruby/PHP. So, you don’t have to spend as much time installing security updates.
- **Convenient hosting:** Convenient if you already use GitHub, that is. GitHub Pages will build and host your Jekyll website at no charge, while simultaneously handling version control.

## Thanks GitHub & Github pages!
Conveniently, Jekyll was developed by Tom Preson-Werner at GitHub. 
There are two types of GitHub pages:

### User/organisational pages:

- Live in master branch of special repo...
- `username.github.io/projectname`

### Project pages:

- Live in **gh-pages** branch of an existing project
- Or the project pages are hosted at `orgname.github.io/projectname`

## Deployment
Let's get github to host our new personal site.

Make sure our site is committed:

    $ git init
    $ git add .
    $ git commit -m "initial commit"

Then on GitHub, create a new repo with the name:

<your github user name>.github.io

Note: *Exactly* your account name - it's case sensitive.

Then, use the instructions that GitHub supply for an existing repo:

    $ git remote add origin git@github.com:<your github user name>/<your github user name>.github.io.git 
    $ git push origin master

Now, we can visit <your github user name>.github.io in the browser. 

Behold! Our free personal blog is now online.

### Further Documentation
There is quite a bit of documentation available on jekyll:

- http://jekyllrb.com/docs/usage
- https://help.github.com/categories/20/articles

----
#Customizing Jekyll

## Review Dir structure
Updated 01/09/2014.

    ├── _includes 
    │     ├── footer.html 
    │     ├── head.html 
    │     └── header.html 
    ├── _layouts 
    │     ├── default.html 
    │     ├── page.html 
    │     └── post.html 
    ├── _posts 
    │     └── 2013-11-21-welcome-to-jekyll.markdown 
    ├── _sass
    │     ├── _base.scss 
    │     ├── _layout.scss  
    │     └── _syntax-hightlighting.scss  
    ├── css 
    │     └── main.scss 
    ├── .gitignore
    ├── _config.yml
    ├── about.md 
    ├── feed.xml
    └── index.html

### Good practise
```
touch README.md
```
Create README file in the root and write some descriptive text explaining your blog site.

## Create a new post

Create new posts in the _posts directory.
Note: Make sure post is in the past!

Explain naming convention of a post:
```
2014-09-01-welcome-to-jekyll.markdown
```
Date followed by title seperated by -.

**Always easier to copy an old post**

## _site ?

### Run it locally!
You can run:

	jekyll serve

But you should use:

    jekyll serve --watch

Visit http://localhost:4000

## Lets have a look at the Dir

When we started the server, jekyll automatically ran a jekyll `build` command that combined our data, layouts and templates to create a static site. 

Notice that our posts got placed in a nested folder structure that gives rise to the blog-like routes.

Built site got put into '_site'.

** DON'T CHANGE _site **

- - -

**Notice that "README.md" got copied across as well (as would `GEMFILE` files if you'd created them).**

## Confusing?

## _site vs root dir

These don't really have any role to play in a static site, so we can tell jekyll to exclude them by editing the '_config.yml'.

`_config.yml`

    exclude: ['README.md']
    
If you had a Gemfile:

	exclude: ['README.md', 'GEMFILE', 'GEMFILE.lock']
	
Then:
```
jekyll serve --watch
```

## Liquid templating intro

"Liquid" is the templating system that Jekyll uses.
Liquid is a special templating library developed by **shopify**.  

### Look at pages

The {{ }} syntax is equivalent to erb's <%= %> tags. Similar to Angular.

**In Liquid, the equivalent to erb's non-outputting tag, <% %>, is {% %}.**

What makes it special is that:
  - we can safely allow the end-user of our site to edit the templates
  - because we CANNOT run arbitrary code inside liquid tags
  - we can only substitute data as content, or use liquid's built in methods (e.g. for loop)

Jekyll uses liquid templating because it allows GitHub to safely run jekyll build for our site, on their servers, safe in the knowledge that we're not able to run arbitrary code. 

## Exclude _site
Because GitHub build our site for us, we don't need to include the "_site" folder in the repo we send to GitHub. 

That's why, if we take a look at the ".gitignore" file jekyll has generated, it deliberately omits the "_site" folder from the repo.

## Substituting data

If we look at "_config.yml", we'll see that it contains the name key and value "Your New Jekyll Site". 

We can change this value to something else:
name: <Your name>'s Personal Page

Restart the server:
```
jekyll serve --watch
```

We use "_config" for important, site-wide, data and settings. 

The markdown and kramdown key/values are settings that tell jekyll:
  - what gem to use to convert markdown to html
  - whether or not we want to use the kramdown gem for syntax highlighting code snippets
  
config.yml is like an initializer.
  
## Replace social links
If you have a look in config.yaml

```
twitter_username: alexpchin
github_username:  alexpchin

```

## Front matter

In `index.html`, `page.html`, `post.html` there is a block of text at the top which is referred to as "Front Matter".

    layout: default
    title: Your New Jekyll Site

This data is used in the layout file by accessing the `page` variable.

Front Matter is YAML syntax data.

## 'Partials'

Jekyll gives us access to templates to customise layouts, and also an equivalent to 'partials' that allow us to extract common, or repeated code.

These partials are included in 

```
_includes/

```
They are included using (look in default):

```
{% include head.html %}
``

## Compare to compiled in _site
Look at _site/index.html

## Assets (css/js/images)
Any non-special files and folders are copied, as-is, to "_site". 
We can organise stylesheets, javascript and image files any way we see fit in the root directory.

## Creating a project site
Github also lets you have a site for each of your repos. 

This is a common way of adding online docs for your project.

Github Pages looks for a project site. on a branch called `gh-pages`.

We can create a site easily using the Github settings.

Step-by-step:

- Create a new repo, "my_awesome_app"
- Go to settings and follow the steps to add a page
- Note that the page code is in the "gh-pages" branch
- we can clone the repo and add things to "master" e.g. `$ rails new .`
- then commit and push

## Other things you can setup
### Pagination

To enable pagination for your blog, add a line to the `_config.yml` file that specifies how many items should be displayed per page:

	paginate: 1
	
The number should be the maximum number of Posts you’d like to be displayed per- page in the generated site.

Comment out index.html content.
Add to `index.html`:

```
<!-- This loops through the paginated posts -->
{% for post in paginator.posts %}
  <h1><a href="{{ post.url }}">{{ post.title }}</a></h1>
  <p class="author">
    <span class="date">{{ post.date }}</span>
  </p>
  <div class="content">
    {{ post.content }}
  </div>
{% endfor %}

<!-- Pagination links -->
<div class="pagination">
  {% if paginator.previous_page %}
    <a href="/page{{ paginator.previous_page }}" class="previous">Previous</a>
  {% else %}
    <span class="previous">Previous</span>
  {% endif %}
  <span class="page_number ">Page: {{ paginator.page }} of {{ paginator.total_pages }}</span>
  {% if paginator.next_page %}
    <a href="/page{{ paginator.next_page }}" class="next">Next</a>
  {% else %}
    <span class="next ">Next</span>
  {% endif %}
</div>
```

## Gemfile
It is possible to create a Gemfile in the root of your

### Gotcha with baseurl
Notice that our project page is served from username.github.io/repo_name/.
This affects the relative links to stylesheets and posts. 
We can visit http://jekyllrb.com/docs/github-pages/ for a quick way to fix this.


http://jekyllrb.com/docs/home/


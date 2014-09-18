# Searching with Ransack gem - 1hour

  - we covered in our first cookbook app, the ability to pass querystring parameters and use them to filter results.

  - let's look at a gem that adds more functionality to this for us.

  https://github.com/ernie/ransack

  clone https://github.com/Pavling/wdi-w4d3-ransacking

  bundle
  rake db:migrate
  rake db:seed

  # gemfile
  gem 'ransack', '1.1.0'

  bundle

(Show the app running, and visit '/articles/published' to demonstrate hard-coded 'filtering' using scopes)

  - Simple mode

    # articles_controller#index
    @q = Article.search(params[:q])
    @articles = @q.result(:distinct => true)

    # articles/index.html.erb
    <%= search_form_for @q do |f| %>
      <p>
        <%= f.label :title_cont %>
        <%= f.text_field :title_cont %>
      </p>
      <p>
        <%= f.label :author_name_start %>
        <%= f.text_field :author_name_start %>
      </p>
      <p>
        <%= f.submit %>
      </p>
    <% end %>


  - Advanced mode

    # routes
    match 'search', to: 'articles#search', via: [:get, :post], as: :search

    # articles_controller
    def search
      index
      render :index
    end

    # articles/index.html.erb
    <%= search_form_for @q, url: search_articles_path, html: {:method => :post} do |f| %>

    - this allows the search to POST, which allows for longer searches than querystring allows...

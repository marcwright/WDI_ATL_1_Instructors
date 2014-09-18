# View helpers

c. 1hr

- Rails extends Ruby... it offers us a lot more "helper" functionality on top of the Ruby basics.
  - For instance:
    ".blank?"
    ".to_sentence"

- Specific view helpers
  - Generally designed to make our life easier; to simplify common tasks in views
  - Generate HTML elements
  - Standardise display

- There's a lot of them!
  http://apidock.com/rails/ActionView/Helpers/

  http://api.rubyonrails.org/classes/ActionView/Helpers.html

- Let's have a play in our homepage.
  
- Some common/frequent use:
  - UrlHelper:
    link_to
      :confirm - JS that we've not covered yet... but we don't need to - Rails does it for us
  
  - FormTagHelper (and FormHelper)
    form_tag
      <%= form_tag('/posts') do -%>
        <div><%= submit_tag 'Save' %></div>
      <% end -%>

    text_field_tag 'ip', '0.0.0.0', :maxlength => 15, :size => 20, :class => "ip-input"

  - NumberHelper
    number_to_currency
      number_to_currency(1234567890.50, :unit => "&pound;", :separator => ",")

    number_to_human
      number_to_human(1234)                                         # => "1.23 Thousand"
      number_to_human(12345)                            # => "12.3 Thousand"
      number_to_human(1234567)                          # => "1.23 Million"
      number_to_human(1234567890)                       # => "1.23 Billion"
      number_to_human(1234567890123)                    # => "1.23 Trillion"
      number_to_human(1234567890123456)                 # => "1.23 Quadrillion"
      number_to_human(1234567890123456789)              # => "1230 Quadrillion"
      number_to_human(489939, :precision => 2)

    number_to_human_size
      number_to_human_size(1234567890)                  # => 1.15 GB
      
  - DateHelper
    distance_of_time_in_words(from_time, to_time = 0, include_seconds = false, options = {})
    time_ago_in_words(from_time, include_seconds = false, options = {}) public
  
  - TextHelper
    pluralize
    pluralize(1, 'person')  # => 1 person
    pluralize(2, 'person')  # => 2 people
    pluralize(3, 'person', 'users')  # => 3 users
    
    truncate("Once upon a time in a world far far away") # => "Once upon a time in a world..."
    
  - TagHelper
    tag
    tag("br")
    tag("div", :data => {:name => 'Stephen', :city_state => %w(Chicago IL)}) 
    tag("input", :type => 'text', :disabled => true) # note the options hash is not wrapped in hash-tags
    tag("input", {:type => 'text', :disabled => true}) # you'll see this a lot in Rails

    content_tag(:div, "Hello world!")
    <%= content_tag :div, :class => "strong" do -%>
      Hello world!
    <% end -%>

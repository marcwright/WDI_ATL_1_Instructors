# The Queueing app for WDI OFFICE HOURS!!
# Bootstrapify erb lesson

* Configuration
  - bundle install
  - rails s

* Database creation
  - using mongo

* How to run the test suite
  - rspec!

* Deployment instructions
  - make sure pull request is accepted and merged in master
  - git pull origin master
  - git push heroku master

* Thank you contributors!
  - Jonny Kang @coderjonny
  - Kaitlin Jaffe @dancingshell

```
      <% if current_user %>

        <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
          Hi, <%= current_user.name %>
          <span class="caret"></span>
        </a>
          <ul class="dropdown-menu" role="menu">
            <li>
              <%= link_to 'Log me out', sessions_path, method: :delete %>
            </li>
            <li class="divider"></li>
            <li><a href="https://github.com/coderjonny/queue_wdi">Fork and make pull request! :)</a></li>
          </ul>
        </li>

      <% else %>

        <li class="dropdown">

          <a href="#" class="dropdown-toggle" data-toggle="dropdown">
            Please log in
            <span class="caret"></span>
          </a>

          <ul class="dropdown-menu" role="menu">
            <li>
              <%= link_to "Sign up", new_user_path %>
            </li>
            <li>
              <%= link_to 'Log in', new_sessions_path  %>	
            </li>
            <li class="divider"></li>
            <li><a href="https://github.com/coderjonny/queue_wdi">Fork and make pull request! :)</a></li>
          </ul>

        </li>

      <% end %>
```

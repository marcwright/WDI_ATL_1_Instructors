class Clown < ActiveRecord::Base
end

<%= @clowns.each do |clown| %>
  <%= clown.name %>
<% end %>


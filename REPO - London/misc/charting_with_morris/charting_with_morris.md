# Charts with Morris JS

Morris.js is a lightweight library that uses jQuery and Raphaël to make drawing time-series graphs easy. You can read the documentation for morris at http://www.oesmith.co.uk/morris.js/index.html

We will be using the morris-rails gem which adds morris to the Rails 3 asset pipeline.  You can read the documentation for gem at https://rubygems.org/gems/morris-rails

You can clone the starter at from this repo: github.com/kymsze/morris_demo
Set up our environment
install the gems:

    gem "raphaeljs-rails"
    gem 'jquery-rails', '~> 2.0'
    gem 'morris-rails', '~> 0.4.9'

    bundle   

We will now need to require these files in our javascripts/application.js

    //= require jquery
    //= require jquery_ujs
    //= require raphael/raphael
    //= require morris
    //= require morris.grid
    //= require morris.hover
    //= require morris.line
    //= require morris.area
    //= require morris.bar
    //= require morris.donut
    //= require_tree .

I have already created a seed file which contains some data from sensus information.

We will need to generate the models for these:
rails g model Migration year_taken pop_in:float pop_out:float net_pop:float
rails g model NatInsurance year_taken london:float uk:float london_as_percent:float

rake db:migrate db:seed

And a site controller
rails g controller Site index

Create a Line Chart
We will make our first chart using the migration data. in the site controller type:
@migrations = Migration.all

Now in our index.html.erb we will create a content tag for an empty div:
<p>
  <h2> Migration in London </h2>
  <%= content_tag :div, "", id: "line-chart", data: {migrations: @migrations.to_json} %>
</p>

EXPLAIN CONTENT TAG AND HTML DATA

Now we can use this data in our javascript, in site.js:
$(function(){
  Morris.Line({
     element: 'line-chart',
     data: $('#line-chart').data('migrations'),
     xkey: 'year_taken',
     ykeys: ['pop_in', 'pop_out', 'net_pop'],
     labels: ['Population In','Population Out', 'Net Population'],
     lineColors: ['#87CEFF', '#4A708B', '#6CA6CD']
  });
});

This will create a simple line chart for us using the data we have provided. 
Create a Bar chart

Now we can do the same to create a bar chart a donut chart and an area chart:

site_controller.rb
@nat_ins = NatInsurance.all

index.html.erb
<p>
  <h2> National Insurance Registrations by Citizens of the EU</h2>
  <%= content_tag :div, "", id: "bar-chart", data: {natins: @nat_ins.to_json} %>
  <%= content_tag :div, "", id: "area-chart", data: {natins: @nat_ins.to_json} %>
</p>

site.js
Morris.Bar({
  element: 'bar-chart',
  data: $('#bar-chart').data('natins'),
  xkey: 'year_taken',
  ykeys: ['london', 'uk'],
  labels: ['london', 'uk']
});

Morris.Area({
  element: 'area-chart',
  data: $('#area-chart').data('natins'),
  xkey: 'year_taken',
  ykeys: ['london', 'uk'],
  labels: ['london', 'uk']
});

This should create two chart showing london vs uk EU national insurance applications.
Create a Donut chart

For the final chart we will make a donut graph. A donut will expect the data to be passed to it as an array of hashes with labels and values. We will do this in the controller.

site_controller.rb
@ni_percent = []
NatInsurance.all.map do |ni| 
  @ni_percent.push({label: ni.year_taken.to_s, value: ni.london_as_percent})
end

In our index.html.erb we will put this in a content tag
<p>
  <h2> National Insurance Registrations percentage by year</h2> 
  <%= content_tag :div, "", id: "donut-chart", data: {ni: @ni_percent.to_json} %>
</p>

Now if we go and view the JSON which is being rendered, we can see it is in the correct format.

Now we can use it in our donut chart. 
site.js
Morris.Donut({
  element: 'donut-chart',
  data: $('#donut-chart').data('ni')
});

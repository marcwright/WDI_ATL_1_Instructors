old	new	...	...		@@ -0,0 +1,269 @@
	1	+	# Planets App Code-Along
	2	+	
	3	+	  - Create an app to store astronomical information about the planets 
	4	+	  - Each planet has a name, an image, an orbit (how far it is from the sun), a diameter, a mass, and a number of moons. (Note: 1 AU is the distance between Earth and the Sun.) This sounds a bit like some of the object-oriented programming we did last week.
	5	+	
	6	+	`  rails new planets -d postgresql`
	7	+	
	8	+	 - check the gemfile and the database.yml
	9	+	 - remove `username: planets` &   `password:` from database.yml
	10	+	 - add `gem 'pry-rails'` to your gemfile
	11	+	 
	12	+	In SQLite, Rails will create the database file for us, but in Postgres we have to create the DB - but Rails gives us a command (which will create a DB whatever the engine we use - so we only need to remember one command)
	13	+	
	14	+	
	15	+	In terminal
	16	+	
	17	+	`rake db:create`
	18	+	
	19	+	`rails g model Planet name:string image:text orbit:float diameter:float mass:float moons:integer`
	20	+	
	21	+	  - edit the migration and add "limit: 2" to the moons field definition
	22	+	  
	23	+	  
	24	+	`rake db:migrate`
	25	+	
	26	+	
	27	+	- look at the planet.rb model in editor
	28	+	    - note the "attr_accessible"
	29	+	    
	30	+	Back in terminal 
	31	+	
	32	+	
	33	+	`p = Planet.create(name: 'Earth', moons: 1, orbit: 1)`  
	34	+	`p2 = Planet.create(name: 'Mars', moons: 2, orbit: 1.5)`  
	35	+	`p3 = Planet.create(name: 'Jupiter', moons: 67, orbit: 5.2) `   
	36	+	    
	37	+	`Planet.all`
	38	+	
	39	+	### In DB seeds.rb
	40	+	
	41	+	`Planet.delete_all`
	42	+	
	43	+	then in terminal 
	44	+	
	45	+	`rake db:seed`
	46	+	
	47	+	
	48	+	### Now in routes.rb add
	49	+	
	50	+	`get '/planets' => 'planets#index'`
	51	+	
	52	+	
	53	+	### Terminal
	54	+	
	55	+	`touch app/controllers/planets_controller.rb`
	56	+	
	57	+	### Now go to controllers/planets_controller.rb in SUBL
	58	+	
	59	+	```
	60	+	
	61	+	    class PlanetsController < ApplicationController
	62	+	      def index
	63	+	      end
	64	+	    end
	65	+	```
	66	+	
	67	+	###Terminal
	68	+	
	69	+	  `mkdir app/views/planets`  
	70	+	  `touch app/views/planets/index.html.erb`
	71	+	
	72	+	 
	73	+	### In index action (your planets controller)
	74	+	   `@planets = Planet.all `
	75	+	
	76	+	### In index view (views / planets)
	77	+	
	78	+	```
	79	+	<% @planets.each do |planet| % >
	80	+	  <%= planet.name %> has <%= pluralize(planet.moons, 'moon') %> .
	81	+	  <br >
	82	+	<% end %> 
	83	+	```
	84	+	
	85	+	
	86	+	
	87	+	### in layouts/application.html.erb
	88	+	
	89	+	```
	90	+	 <nav >
	91	+	   <ul >
	92	+	     <li><%= link_to('Planets', planets_path) %></li >
	93	+	     <li><%= link_to('New Planet', planets_new_path) %></li >
	94	+	   </ul >
	95	+	 </nav> 
	96	+	```
	97	+	
	98	+	
	99	+	### routes & add 'new' action to PlanetsController
	100	+	
	101	+	- in routes 
	102	+	
	103	+	
	104	+	`get '/planets/new' => 'planets#new' `
	105	+	
	106	+	- terminal
	107	+	
	108	+	`touch app/views/planets/new.html.erb `
	109	+	
	110	+	`rake routes`
	111	+	
	112	+	
	113	+	### In planets/new.html.erb
	114	+	```
	115	+	    <form method='post' action='/planets'>
	116	+	      Name:
	117	+	      <input type='text' name='name' autofocus>
	118	+	      <br>
	119	+	      Image:
	120	+	      <input type='text' name='image'>
	121	+	      <br>
	122	+	      Orbit:
	123	+	      <input type='text' name='orbit'>
	124	+	      <br>
	125	+	      Diameter:
	126	+	      <input type='text' name='diameter'>
	127	+	      <br>
	128	+	      Mass:
	129	+	      <input type='text' name='mass'>
	130	+	      <br>
	131	+	      Moons:
	132	+	      <input type='text' name='moons'>
	133	+	      <br>
	134	+	      <button>planet me!</button>
	135	+	    </form>
	136	+	```
	137	+	
	138	+	### In routes
	139	+	
	140	+	`post '/planets' => 'planets#create'`
	141	+	
	142	+	### PlanetsController
	143	+	
	144	+	```
	145	+	def create
	146	+	  render text: 'test'
	147	+	end
	148	+	```
	149	+	
	150	+	#### Now replace in PlanetsController create action
	151	+	
	152	+	`Planet.create(params[:planet])`  
	153	+	`redirect_to(planets_path)`
	154	+	
	155	+	
	156	+	
	157	+	### Back in routes.rb
	158	+	
	159	+	`get '/planets/:id' => 'planets#show'
	160	+	
	161	+	`touch app/views/planets/show.html.erb`
	162	+	
	163	+	### PlanetsController
	164	+	
	165	+	```
	166	+	def show
	167	+	  render text: 'show planet'
	168	+	end
	169	+	```
	170	+	
	171	+	#### Now in terminal 
	172	+	
	173	+	`rake routes`
	174	+	
	175	+	
	176	+	## show doesn't have a name !!
	177	+	
	178	+	update your routes to
	179	+	
	180	+	`get '/planets/:id' => 'planets#show', as: 'planet'`
	181	+	
	182	+	
	183	+	#### go to the Rails console
	184	+	
	185	+	`  app.planet_path`
	186	+	
	187	+	`  app.planet_path(3)`
	188	+	
	189	+	
	190	+	
	191	+	### In index.html.erb
	192	+	
	193	+	`<%= link_to(planet.name, planet_path(planet.id)) %>`
	194	+	
	195	+	### PlanetsController
	196	+	
	197	+	`@planet = Planet.find(params[:id])`
	198	+	
	199	+	### show.html.erb
	200	+	
	201	+	`<%= image_tag(@planet.image) %>`
	202	+	
	203	+	
	204	+	
	205	+	
	206	+	# Deleting planets (Death Star method?)
	207	+	
	208	+	### routes  
	209	+	`post '/planets/:id/delete' => 'planets#destroy', as: 'planet_delete'`
	210	+	
	211	+	### index view
	212	+	`<%= button_to('Delete Planet', planet_delete_path(planet.id)) %>`
	213	+	
	214	+	### controller
	215	+	
	216	+	```
	217	+	def destroy
	218	+	  planet = Planet.find(params[:id])
	219	+	  planet.destroy
	220	+	  redirect_to(planets_path)
	221	+	end    
	222	+	```
	223	+	
	224	+	# Editing planets (terraforming?)
	225	+	
	226	+	### routes
	227	+	`get '/planets/:id/edit' => 'planets#edit', as: 'planet_edit'`
	228	+	
	229	+	### controller
	230	+	
	231	+	```
	232	+	def edit
	233	+	  @planet = Planet.find(params[:id])
	234	+	end
	235	+	```
	236	+	
	237	+	### edit view
	238	+	
	239	+	`cp app/views/planets/new.html.erb app/views/planets/edit.html.erb`
	240	+	
	241	+	### index page  
	242	+	
	243	+	`<%= link_to('Edit Planet', planet_edit_path(planet.id)) %>`
	244	+	
	245	+	
	246	+	### edit view
	247	+	
	248	+	#####edit the form and fields...
	249	+	  `<form method='post' action='<%= planet_path(@planet.id) %>'>`
	250	+	
	251	+	  `<input value='<%= @planet.name %>' type='text' name='planet[name]'>`
	252	+	
	253	+	
	254	+	### routes
	255	+	
	256	+	#### need an update route for the form
	257	+	in routes
	258	+	
	259	+	 ` post 'planets/:id' => 'planets#update'`
	260	+	
	261	+	#### and an update action in the controller
	262	+	
	263	+	```
	264	+	  def update
	265	+	    planet = Planet.find(params[:id])
	266	+	    planet.update_attributes(params[:planet])
	267	+	    redirect_to(planets_path)
	268	+	  end
	269	+	```
1	270	 	

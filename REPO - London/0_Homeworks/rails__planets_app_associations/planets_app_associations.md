# Homework Planets App

Tonight Homework is to create the planets app with associations. 

You'll need 3 models:

* Planet
  * Name
  * Orbit
  * Image
  * Diameter
  * Mass
* Moon
  * Name
  * is_solid
* Galaxy
  * Name

* A galaxy has many planets
* A planet has many moons
* A galaxy has many moons through planets

You can use scaffold. Each form for each resource has to display a dropdown to choose an association
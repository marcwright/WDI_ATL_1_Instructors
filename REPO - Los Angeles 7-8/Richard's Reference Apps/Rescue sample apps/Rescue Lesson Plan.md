##LESSON PLAN - RESCUE
Richard Grossman

OBJECTIVE:

A) Program to recover gracefully from errors
B) Not look like an idiot when something goes wrong in your web app


Introduce concept of TRY / EXCEPT / FINALLY
Ruby syntax: BEGIN / RESCUE / ELSE / ENSURE

Usage recommendation:

Whenever accessing resources you don't control, such as external
sites, api's, uploaded files, upload/download  operations

### RESCUE0.rb
Type error

### RESCUE1.rb
Use RESCUE to cure error

### RESCUE2.rb
User enters URL but errors not handled

### RESCUE3.rb
User enters URL - errors handled

### RESCUE4.rb
Handles error and reports on it

### RESCUE5.rb
Adds ENSURE

### RESCUE6.rb
Adds RETRY

### RESCUE7.rb
Adds timeout
Test with http://www.cnn.com:81
ie specify non-responding port 81

### RESCUE8.rb
Differentiate between timeout and other errors

### RESCUE9.rb
Additional errors, stacked

Questions

Wrap




#Ruby Identifiers
Here we'll go briefly over the small group of Ruby identifiers and their naming conventions.

- Variables
	- Local
	- Instance
	- Class
	- Global
- Constants
- Keywords
- Method names

##Variables

###Local variables
Local variables start with a lowercase letter or an underscore and consist of letters, underscores, and/or digits. The convention states the preferred use of snake_case over camelCase for local variables, when creating local variables names which consists of multiple words.

###Instance variables
Instance variables serve the purpose of holding individual objects start with a @ and consist of the same character set as local variables thereafter. Instance variables may have a uppercase letter as the first position after the @. Commonly, a lowercase letter is used right after the @.

###Class variables
Class variables store information for the whole class and follow the same rules as instance variables. Class variables start with @@.

###Global variables
Global variables are recognizable by their leading $. The segment after the dollar sign doesn’t follow local-variable naming conventions; there are global variables called $:, $1, and $/, as well as $stdin and $LOAD_PATH. The use of global variables is discouraged for the most part.

###Variable naming convention summary
<table>
<tr><th>Type</th><th>Ruby Convention</th></tr>
<tr><td>Local</td><td>first_name</td></tr>
<tr><td>Instance</td><td>@first_name</td></tr>
<tr><td>Class</td><td>@@first_name</td></tr>
<tr><td>Global</td><td>$FIRST_NAME</td></tr>
</table>

##Constants
Constants begin with an uppercase letter. A, String, FirstName, and STDIN are all valid constant names. The Ruby convention is to use either camel case (FirstName) or underscore-separated all-uppercase words (FIRST_NAME) in composing constant names from multiple words.

##Keywords
Ruby has numerous keywords, which are predefined, reserved terms associated with specific programming tasks and contexts. There are about 40 reserved keywords, and they’re generally short, single-word (as opposed to underscore-composed) identifiers. Keywords include *def* (for method definitions), *class* (for class definitions) and *if* (conditional execution).

##Method names
Names of methods in Ruby follow the same rules and conventions as local variables (except that they can end with ?, !, or =). In Ruby, methods don’t call attention to themselves as methods but rather blend into the texture of a program as expressions that provide a value. Sometimes when you look at Ruby source code, you can’t tell just by looking at an expression whether you’re seeing a local variable or a method name. This is intentional.
## RegExp Notes

#### 25 Minutes - RegExp Research + Exploration

#### Basics of a Regex

__RegExps begin and end with slashes__
```ruby
pattern = //  # => 'pattern' is now a valid regex
```

__We can also instantiate Regular Expressions using the constructor method. The advantage the constructor gives us is that we can pass it arguments to make it dynamic.__

```ruby
# Parker hart, what text do you want to search for?"
user_search = gets.chomp
desired_pattern = Regexp.new(user_search, "i")
```
__RegExp flags__
```ruby
/camel/.match("cAmeLcaSe") # => nil
/camel/i.match("cAmeLcaSe") # => <Match object>
```

__The Escape Character__
RegExps owe much of their unreadability to the fact that they make heavy use of the escape (`\`) character to denote certain keys like `\d`, which will match any single digit character. 

__We also have to escape forward slashes, so you see those all over the place as well__

```ruby 
espn_regex = /http\/\/:espn.go.com\/?/
```
__Matching any of a group of letters usering Square Brackets
```ruby
  /[zxy]/i.match("brad pitt") # => nil
  /[zxyp]/i.match("brad pitt") # => <Match Object>
```
__Matching anything BUT a certain character__
```ruby
  /[^zxy]/i.match("brad pitt")
  /[^zxyp]/i.match("brad pitt")
```

__Matching one sequence or another__
```ruby
desired_pattern = Regexp.new("what the he(ck|ll)", "i")
"What the heck?".match(desired_pattern)
"What the hell is this?".match(desired_pattern)
```

__The Optional, 0 to Many, and 1 to Many keys__
```ruby
/\w?/
/\w*/
/\w+/
```

__Bring up the inversion that occurs when you capitalize a RegExp key__

## Partner Activity - ZIP Code (No STRING MANIPULATION METHODS. ONLY REGEX)
__Okay, so we know how to do the basics to see if a string matches a certain pattern... But where Regular Expresssions really become powerful is when we determine *what* was matched. For this, we use *captures*. Anything within parentheses will be captured.__

```ruby
# let's dissect this line
pattern = /https?:\/\/w{3}?\.(\w+)\.com/i
"http://www.rottentomatoes.com, http://www.ebay.com".scan(pattern)

username_regex = /^[a-z0-9_-]{3,16}$/
hexidecimal_regex = /^#?([a-f0-9]{6}|[a-f0-9]{3})$/
```

#### 10 minutes - Play Around With Captures at Rubular and in the Console with the `.scan` method

#### 15 minutes - Spam Bot




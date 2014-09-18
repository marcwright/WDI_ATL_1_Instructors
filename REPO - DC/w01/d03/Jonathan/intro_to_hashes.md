## Intro to Hashes

#### Learning Objectives

* What are hashes?
* Why are they useful?
* Where would you use a hash?

---

#### Creating a new empty hash

* hash = Hash.new
* hash = {}

#### Creating a hash symbol/string keys

```
hash = {  
  :sym_key => "Hello",  
  "string_key" => "World"  
}
```

* hash[:symbol_key]
* hash["string_key"]


#### Creating a hash with other key types

```
hash = {
  :sym_key => "Okay",  
  "string_key" => "Yup"  
  23 => "Smells like an array",  
  true => "Bad idea"  
}
```
* hash[23]
* hash[true]

#### Alternate symbol syntax

```
location = {  
  city: "Washington",  
  state: "DC",
  country: "USA"  
}
```

#### Direct Key Assignment

```
location = {}
location[:city] = "Washington";
location[:state] = "DC";
```

#### Nested structures

```
post = {  
  user: {
  	name: 'Greg',
  	email: 'greg@ga.co'
  },
  tags: ['news', 'singing'],
  story: 'La, la, la!'
}
```

* post[:user][:name]
* post[:tags][1]

#### Common Hash Methods

* hash.empty?
* hash.has_key?(:key)
* hash.has_value?(:key)
* hash.delete(:key)
* hash.merge({key: 'value'})
* hash.keys
* hash.values
## Memory and Computing

### Learning Objectives

At the end of this lesson you should be able to:

1. Explain what memory is (in abstract terms) and how it differs from storage systems.
* Name the two aspects of any piece of data in memory, and how we describe them in our Ruby programs.
* Explain what a reference (or a pointer) is.
* Describe the two forms of variable assignment used by programming languages.

### A quick note on vocab…

Memory is not your hard disk. You are now a programmer. **NEVER REFER TO YOUR HARD DISK AS MEMORY.** Many people do. You will be tempted. You may want to call it "persistent memory…" **DON'T.**

### Layers of abstraction

Programs read to (and from) memory by talking to the operating system. This is done directly by compiled languages; this relationship is further abstracted by the *interpreters* for languages such as Ruby or JavaScript.

Each unit of memory can be described in two ways:

  * its contents
  * its address (the "name" of the piece of memory)

### References and pointers

Our programs have to store data in memory, obviously. Here is where all of this gets tricky! Each data point is stored in memory, and then is __referenced__ by our program in order to retrieve its contents.

When we talk about a reference, we are talking about the address of a piece of data in memory. Still, it's not us that references some data in memory -- it's our program! We create helpful data objects (often in the form of variables) that hold those references (addresses) in nice, readable names.

_Thus we have data in our memory whose contents is the address, or **reference**, to some other data in memory. The technical term for such data is a **pointer**._

The terms "reference" and "pointer" are often used interchangeably. In actuality they have slightly different meanings, but for now we will just use the term "reference", and you can know we are also talking about "pointers".

Luckily, referencing (ie, pointers) is largely handled for us (abstracted away from us) by the languages we've been using! Unluckily: to be a programmer you still need to understand what these things are!

### Understanding References in Ruby

Languages have to ways to assign names (ie variables) to data. 

* Assignment by value
* Assignment by reference.

We understand assignment by value more intuitively. That is, a variable name is assigned a value, and it holds that value until it is reassigned another.

```ruby
x = 1
y = x
x = 2
y
# => 1
```

More difficult is the concept of assignment by reference.

Everything in Ruby is an object... For the most part.

_One exception is a variable itself. Variables are, instead, references to objects. This can be thought of as a name by which we refer to the object, or an entity that "points" to an object._

Thus whenever we do assignment in Ruby, we do assignment by reference.

This becomes most difficult when we __mutate__ the underlying object (remember the __.methods_with_!__?). These methods can be called mutator methods, or (more often, when we start using more complex objects) __setter__ methods (ie, they change, or set, one of many values that an object holds).

```ruby
x = "Won't get fooled again!"
y = x
x.upcase!
y
# => "WON'T GET FOOLED AGAIN!"
```

In fact, even with the Ruby example above (given the numbers), we are using assignment by reference. However, with numeric objects Ruby offers us no mutator methods. Thus, we can assume that numbers in Ruby are __immutable__.

__Note: JavaScript, which we will come to, uses a mix of assingment by reference and assignment by value. We will need to recognize the difference!__

```ruby
name = "Peter"
nombre = name
name += " Lai"
nombre
# => "Peter"
```

`+=` creates a copy

Garbage collection

### Exercise

Assignment Madness!
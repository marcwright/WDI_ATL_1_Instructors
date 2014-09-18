# Introduction to Linked Lists

## Objective
- Students know that a linked list exists
- Students can think about two interrelated bits of data. 

## Background
- So. I've said a few times that we can only work as fast as we do by building on the work of others. Today's kind of an example of that. 
- Ruby gives us things like variable-sized arrays and hashes, but someone had to write the code to make that happen. 
- What if we lived in a world where we didn't have arrays? What if we had to write our own? 
  - You won't have to write your own. 
  - Although you may get asked this in an interview. 
  - It's not really about the list. It's about thinking about data. 

## What's a linked list? 
- A linked list is a **data structure**. It stores information in a chain of nodes. 
- It only remembers one element. No matter how many you have. 
- Each node stores two things: the value it's been asked to store, and a link to the next one. 

## How do we write one? 
- Let's start with a node. What does a node store? 
  ```
  class Node
    attr_reader :value
    attr_accessor :next

  def initialize(value)
    @value = value
    @next = nil
    end
  end
  ```

- And now, our LinkedList. Let's do some boilerplate. 
  ```
  class LinkedList
    def initialize
      @head = nil
    end
  
  # def add(value)
  #   new_node = Node.new(value)
  ```

- Now. How are we going to add an element to the list? 
  - If we've got nothing in the list, then our @head is just the new node. 
    ```
    unless @head
      @head = new_node
    ```
  - Otherwise, we need to find the last node, and set its next value to our newly created node. 
    ```
    else
      node = @head
      while node.next
        node = node.next
      end
      node.next = new_node
    end
  end
    ```

- Prove it works. 
  ```
  irb
  require_relative "linkedlist"
  ```

- So what's the properties of this? 
  - How long does it take to add a node? 
    - Quick at first, long in the long term.
    - O(n), which isn't all that bad. 
  - Could we make it better? 
  - Could we make it O(1)?
  - And simpler? 
  - What if we did it in reverse? 
  ```
  def <<(value)
    new_node = Node.new(value)
    new_node.next = @head
    @head = new_node
  end
  ```

- Let's prove it works. Let's write a show method. 
  - Should start at the head, and print the value of the current node, with an arrow to the next one if there's a next node. 
  ```
  def show
    output = ""
    node = @head
    while node
      output += "#{node.value}"
      output += " -> " if node.next
      node = node.next
    end
    output
  end
  ```

- And what about how long the list is? 
  - Pretty much the same, but with a count. 
  ```
  def length
    length = 0
    node = @head
    if node
      length = 1
      while node = node.next
        length += 1
      end
    end
    length
  end
  ```


- Bonus: deletion.
  - BRAINMELT AHEAD
  - There may be a better way to do this. 
  - are we going to remove all occurrences, or just the first one we find? 
  ```
  def delete(value_to_delete)
    if @head.value == value_to_delete
      @head = @head.next
    else
      previous_node = @head
      current_node = @head.next
      while current_node
        if current_node.value == value_to_delete
          previous_node.next = current_node.next
        else
          previous_node = current_node
        end
          current_node = current_node.next
        end
      end
    end
  end
  ```


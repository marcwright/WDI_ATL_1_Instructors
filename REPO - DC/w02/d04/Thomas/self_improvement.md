## Self-Improvement Homework

#####Step 1:
Review your self-assessment from last week. If you haven't filled it out yet, do so. This is mandatory.

#####Step 2:
Target 10 concepts or mechanics you feel unsure of, and write them into the numbered list below.

#####Step 3:
Research all of the items you listed, and write in either an explanation (if the item is a concept), or the necessary code snippet (if the item is a mechanical question).


1. Encapsulation:
When building anything with multiple moving parts, it is necessary to establish each component's boundaries to avoid tangling dependencies.  Each component is aware only of it's own internal workings.

2. Difference between context and describe:
"Describe" is used to wrap a series of "it" statements against one functionality, while "context" is used to wrap a series of "it" statements against one functionality under the same state.  "Context" nested within a "describe" branch represents tests following a common parameter.

3. Difference between block and method:
A block is simply a syntatic structure encapsulated between "do" and "end" keywords.A block can be "invoked" using a yield statement.  A method is a bundled bit of code that is given a name, can be fed parameters, will always return something, and can be "called" upon certain objects.

4. DRY:
DRY stands for "dont repeat yourself" and represents the principle of reducing redundant code.  The principle states that each component of the program should have a single function, and the code contained in the the object should be just enough to accomplish this singular function.

5. YIELD:
A yield statement will pause the progress of a method, invoke an established block to return some value, and then allow the method to proceed.  A yield statement can accept parameters.

6. Imperative and declarative programming:
Imperative programming (not DRY) explicitly states each step to be carried out in order to fulfil a task.  Declarative programming (DRY) declares the desired end result, and assumes a degree of faith that whatever actors employed to carry out the task will work towards accomplishing this goal. Ruby tends to employ declarative programming.

7. OOP:
OOP is designed as a collection of interacting objects.  An application is the sum of its parts.  These individual parts are testable, easily scalable, and individually customizable.  Core concepts of OOP include Role, Interface, and Encapsulation.  Role: an object should have only one role, and just enough code to accomplish this.  Interface: a set of known methods.  Objects communicate with each other using a known set of methods.  Encapsulation: objects are self-contained black boxes of code that conceal their internal methodologies; we are not concerned with these innner-workings, only that they work.

8. loop vs. enumerator
An enumerator is useful for evaluating through a structured set of data with a beginning and endpoint. A loop should be employed to conditionally repeat a process.

9. Enumerating through an array of hashes!
We can use an array method to enumerate through a list of hashes.  Upon arriving at each hash we are able to then treat each array value as a hash.  The inverse will not be true.  Becuase of specified OOP guidlines, when enumerating through an array, we cannot use methods associated with hashes, when acting upon hashes, we cannot invoke methods specified for arrays.

10. What is an object:
An instantiated class object, though it can store data, is NOT a hash OR an array.  An instantiated class object contains both data and behaviors.


__NOTE:__ This is mandatory



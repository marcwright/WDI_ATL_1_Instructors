## Self-Improvement Homework

#####Step 1:
Review your self-assessment from last week. If you haven't filled it out yet, do so. This is mandatory.

#####Step 2:
Target 10 concepts or mechanics you feel unsure of, and write them into the numbered list below.

#####Step 3:
Research all of the items you listed, and write in either an explanation (if the item is a concept), or the necessary code snippet (if the item is a mechanical question).


1. Differentiate between different languages and frameworks
  - A language is the syntax and semantics in building code. A framework is a sort of library that simplifies coding in a given language.

2. Explain the difference between imperative and declarative programming
  Imperative programming: telling the computer how to do something, and as a result what you want to happen will happen
  Declarative programming: telling the computer what you would like to happen, and let the computer figure out how to do it.

3. Explain what yield does in the context of a block
  Yield is a function/method Ruby calls when it expects a block

4. Identify when and how to use the enumerator methods `.each`, `.map`, `.join`, `.select`, `.reduce`

  -.each - returns original array
  .map  - copy of original array - transformed
  .join - combines elements of an array returns a String
  .select - takes a subset of original collection, defines condition that evaluates true or false and keeps/returns subset that evaluates to true.
  .reduce - combines everything in the array

5. Describe what an interface is
  - An interface is a shared boundary over which two systems share information

6. Explain the use of `super` in Ruby
  - 'super' allows for a child class to call attributes that were explicitly defined in the parent class.

7. Write a class that inherits from another class
    class Animal
      def initialize
        @brain = "yes"
      end
    end

    class Human
      def initialize
        super
        @legs = 2
        @brain = "better"
      end
    end

8. Agile vs. Waterfall
  Waterfall is a linear approach to software development. In this methodology, the sequence of events is something like:
    Gather and document requirements
    Design
    Code and unit test
    Perform system testing
    Perform user acceptance testing (UAT)
    Fix any issues
    Deliver the finished product

  Agile
    Agile came about as a “solution” to the disadvantages of the waterfall methodology. Instead of a sequential design process, the Agile methodology follows an incremental approach.
    Developers start off with a simplistic project design, and then begin to work on small modules. The work on these modules is done in weekly or monthly sprints, and at the end of each sprint, project priorities are evaluated and tests are run. These sprints allow for bugs to be discovered, and customer feedback to be incorporated into the design before the next sprint is run.
    The process, with its lack of initial design and steps, is often criticized for its collaborative nature that focuses on principles rather than process.

9.  ACID
    A system for guarenteeing database transactions and integrity:

    Atomicity
    Consistency
    Isolation
    Durability
    Consider the transfer of funds between two bank accounts…

    Atomicity guarentees that all transactions either succeed together, or fail together. ie: one account isn't debited without the other being credited.

    Consistency guarentees that all transactions abide by the rules of the database. ie: transactions that would take an account below zero must be preemptively aborted.

    Isolation guarentees that transactions are never seen in an intermediary state. ie: the debit transaction is never reported until the credit has also resolved.

    Durability guarantees that all confirmed transactions are recorded and thus reproducible in the event of a system failure


10. Foreign keys are keys from other tables


__NOTE:__ This is mandatory



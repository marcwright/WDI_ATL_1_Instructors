## Self-Improvement Homework

#####Step 1:
Review your self-assessment from last week. If you haven't filled it out yet, do so. This is mandatory.

#####Step 2:
Target 10 concepts or mechanics you feel unsure of, and write them into the numbered list below.

#####Step 3:
Research all of the items you listed, and write in either an explanation (if the item is a concept), or the necessary code snippet (if the item is a mechanical question).


1. - Add and remove a remote
This was more of a semantic problem. After the creating our forks and creating our remotes, we haven't used that command again. After reading I understand that adding or removing remotes refers to the other versions of our repositories hosted on GitHub (the repository the instructors manage and my fork.)

2. - - Create, access items in, change the value of items in, and manipulate items in nested collections (arrays & hashes)

This has been one of the biggest challenges for me. Keeping a track of what each type of value is as I proceed further and further down into nested data sets has been difficult. However, through continued practice I feel I have improved significantly and I know that with all the repetition, this mechanic will not continue to give me problems.
As for a code snippet, I am unsure what to list. I understand the methods available to arrays and hashes, and I have become familiar with errors informing me that my method calls are failing on object that lack the specific method I am trying to use. Additionally, the practice of writing out the flow of a nested data set has let me keep better track of the values I am trying to access.

3. - - Write data to a file

This was giving me problems mostly because we have only done it once. Our Potter homework had us reading from a file and so I got comfportable with that. It was just the syntax giving me problems and I am confident I understand that now.

Code Snippet: use the "w" value when delcaring a new file within your program to denote that the file will be writeable. Use the .write method to add information to said file.
f = File.new("file_name", "w")
  f.write "whatever_data"

4. - - Identify when and how to use the enumerator methods `.each`, `.map`, `.join`, `.select`, `.reduce`

Remembering what methods are available has given me some issues. Ruby-docs is really helpful.
  .each: When you want to go through each item in an array, run some code on each item, but still maintain the array in its original state.
  .map: Like .each, but it will return a new array with the values from whatever code you ran on the original array.
  .join: Will combine all the items in an array into a string, with a specified 'something' inbetween each item (usually a comma, or space.)

5.  - - Create a hash, access items in a hash, change the value of items in a hash

Arrays were easier to grasp for me than hashes. I have gotten much better at hashes, but I know I could use more practice.
Create a hash: hash = Hash.new or hash = {:key => value}
Access items in a hash: hash[:key] will return the value associated with that key. Also useful are .keys and .values to see all of those types of data inside a hash.
Change the value of an item in a hash: You can use hash[:key] = value to change the value associated with a specific key.

6.

7.

8.

9.

10.


__NOTE:__ This is mandatory


I really don't want to come off as over-confident, but I don't think I can really put anything else. I feel like I have a pretty good grasp of the concepts and mechanics that are on the self-assessment, other than the ones I have listed above (obviously). I hope to soon be able to make the assessment completely green.

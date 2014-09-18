#AngularJS


###Skill Drills
- Practice using **ng-bind** and **double curly braces** to evaluate expressions on the page. Remember that **ng-bind** is used as an attribute on an element, but otherwise, the two work similarly. 
	- Try printing a string on the page.
	- Try a math operation, like addition or multiplication.
	- Try calling a property of $scope (you'll need to declare it in your JS file).
	- Try doing an operation to a property of $scope (like adding a number to an integer property). 
- Repeater drill! Use **ng-repeat** on a div, then iterate over an array set on a property of $scope. 
	- Try repeating only HTML and CSS (but powering the repeater with that array from your JS).
	- Try repeating HTML, CSS, and some text inside of a div that corresponds to object properties from the array.
	- Try repeating HTML with a background image driven by object properties from your array.
- Model student: practice using **ng-model** on the following form controls (see if you can figure out the ones we haven't used in class!):
	- text field
	- text area
	- radio buttons
	- checkboxes
	- dropdown menu (hint: you can use [another angular directive](https://docs.angularjs.org/api/ng/directive/select) with these along with ng-model)


###Mini-Projects
- Chat app! Make an app that allows users to post chats to a chat room. You'll need to use a few directives (**ng-model** is a good one to use along with a text input, for example). Once we learn FireBase, you can save chats/sync the room across devices (but until then, it's a neat idea to get this chat app started).
	- Get creative with the styling, and make it look less boring than HipChat.
	- Allow users to set/change their usernames, and make those appear next to each user's messages.
- Personal to-do list. Create your own to-do list. It's a great practice app to make for yourself (bonus: when we add a back-end, you can keep your to-dos persistent!). 
	- Give yourself separate columns for complete and incomplete tasks.
	- Prioritize tasks, and sort them by priority (high at the top, then medium, then low).
- RPS, Revisited: re-make **Rock, Paper, Scissors** with AngularJS!





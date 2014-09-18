#Run a javascript console inside sublime text

It’s very simple. We’ll use Node.js to compile and run javascript. This comes with Google’s V8 JS engine and its own set of rich libraries/ modules. Here goes:

1. Install [Node.js](http://nodejs.org/) using the conventional ‘.configure’, ‘make’, ‘make install’ trio. Put it in common location or add the installed dir to $PATH.

2. In sublime text, create a new build system:
‘Tools > Build System > New Build System…’. This creates a new file with build template.

3. Modify the file as below:

		{
		"cmd": ["node", "$file"]
		}

4. Save it as

	$HOME/.config/sublime-text2/Packages/User/JavaScript.sublime-build

5. A new entry “JavaScript” (i.e. name given to the new build file) should come in Tools > Build System menu. Done. Just to test, create a ‘test.js’ with

		console.log("Hello, World!);

	in it. Build and run the file using Command+B or menu item as you like.
	
	
	'nuff said.